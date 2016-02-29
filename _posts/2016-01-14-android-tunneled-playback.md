---
layout: post
title: "Tunneled Playback in Android"
description: ""
category:
tags: ["programming", "java", "android"]
---

# What is Tunneled Playback

I found nothing about this term on internet. I can guess there is a tunnel between codec and rendering device, so the operating system need not to pull decoded data back and send to rendering device again. Since I/O is usually the bottleneck, the tunnel should improve the overall performance.

# Check Codec Capabilities

[Ganesh had a good answer about how Android know codes' capabilities.](http://stackoverflow.com/questions/22857059/how-mediacodec-finds-the-codec-inside-the-framework-in-android) In brief, there is a file in **/etc/media_codecs.xml** which include more detailed codes information in the other xmls.

{% highlight java %}
MediaCodecInfo codecInfo =
  MediaCodec.createDecoderByType("video/avc").getCodecInfo();

boolean hasTunneledPlayback = codecInfo
  .getCapabilitiesForType("video/avc")
  .isFeatureSupported(
    MediaCodecInfo.CodecCapabilities.FEATURE_TunneledPlayback);

Log.i("demo", (hasTunneledPlayback ? "" : "no" ) + " tunneled playback");
{% endhighlight %}

# Audio Session

A/V sync is the most important feature of video playback. Since tunneled playback handles both decoding and rendering, there should be a method to synchronize audio and video. They are connect by an audio session.

{% highlight java %}
// getSystemService from an Activity.

AudioManager audioManager =
  (AudioManager)this.getSystemService(Context.AUDIO_SERVICE);

int audioSessionId = audioManager.generateAudioSessionId();
{% endhighlight %}

# Config Video Codec

Before configure the video decoder, enable tunneled playback and set the audio session to its' media format.

{% highlight java %}
// MediaFormat format = this.extractor.getTrackFormat(i);

// config video codec
videoMediaFormat.setFeatureEnabled(
  CodecCapabilities.FEATURE_TunneledPlayback, true);

videoMediaFormat.setInteger(
  MediaFormat.KEY_AUDIO_SESSION_ID, this.audioSessionId);

this.decoder = MediaCodec.createDecoderByType(mimeVideo);
this.decoder.configure(videoMediaFormat, this.surface, null, 0);
{% endhighlight %}

# Create AudioTrack and Config Audio Codec

Set audio session to AudioAttributes, and use it to configure the AudioTrack. Now Android knows we need both **Tunneled Playback** and **Hardware AV Sync**.

{% highlight java %}
// MediaFormat format = this.extractor.getTrackFormat(i);

// create audio track
int sampleRate = audioMediaFormat.getInteger(MediaFormat.KEY_SAMPLE_RATE);
int channelCount = audioMediaFormat.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
int channelConfig = (channelCount == 1 ? AudioFormat.CHANNEL_OUT_MONO
                                       : AudioFormat.CHANNEL_OUT_STEREO);

int minBufferSize = AudioTrack.getMinBufferSize(
  sampleRate,
  channelConfig,
  AudioFormat.ENCODING_PCM_16BIT);

AudioAttributes audioAttributes = (new AudioAttributes.Builder())
  .setLegacyStreamType(AudioManager.STREAM_MUSIC)
  .setFlags(AudioAttributes.FLAG_HW_AV_SYNC)
  .build();

AudioFormat audioFormat = (new AudioFormat.Builder())
  .setChannelMask(channelConfig)
  .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
  .setSampleRate(sampleRate)
  .build();

this.audioTrack = new AudioTrack(
  audioAttributes,
  audioFormat,
  minBufferSize * 3,
  AudioTrack.MODE_STREAM,
  this.audioSessionId);

try {
  String mimeAudio = audioMediaFormat.getString(MediaFormat.KEY_MIME);

  this.decoder = MediaCodec.createDecoderByType(mimeAudio);
  this.decoder.configure(audioMediaFormat, null, null, 0);
}  catch (IOException e) {
}
{% endhighlight %}

# Sync Audio and Video

Wait seconds, we tell the video codec when to render a frame by call [MediaCodec.queueInputBuffer](http://developer.android.com/reference/android/media/MediaCodec.html#queueInputBuffer(int, int, int, long, int)) with presentation time microseconds, not system time, so when will the frames be rendered exactly? It is a black box prior API 23. There is a new [**write**](http://developer.android.com/reference/android/media/AudioTrack.html#write(java.nio.ByteBuffer, int, int, long)) method for AudioTrack in API 23. API 23 was released and we can read what it does to guess how to achieve av sync before API 23 (if it's available).

Before writing audio samples into AudioTrack, we have to prepare an av sync header with presentation time in nanoseconds. And we need any other new API for this. You can find the Android AudioTrack's source code [here](https://android.googlesource.com/platform/frameworks/base/+/master/media/java/android/media/AudioTrack.java).

{% highlight java %}
int outputBufferIndex = this.decoder.dequeueOutputBuffer(audioBufferInfo, 1000);

// check if outputBufferIndex is valid.

ByteBuffer avSyncHeader = ByteBuffer.allocate(16);

avSyncHeader.order(ByteOrder.BIG_ENDIAN);
avSyncHeader.putInt(0x55550001);
avSyncHeader.putInt(audioBufferInfo.size);
avSyncHeader.putLong(audioBufferInfo.presentationTimeUs * 1000);
avSyncHeader.position(0);

ByteBuffer audioOutputBuffer = this.decoder.getOutputBuffer(outputBufferIndex);

audioOutputBuffer.clear();
audioOutputBuffer.position(0);

this.audioTrack.write(avSyncHeader, 16, AudioTrack.WRITE_BLOCKING);
this.audioTrack.write(
  audioOutputBuffer, audioBufferInfo.size, AudioTrack.WRITE_BLOCKING);

this.decoder.releaseOutputBuffer(outputBufferIndex, false);
{% endhighlight %}
