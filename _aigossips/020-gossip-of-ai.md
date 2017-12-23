---
layout: post
title: "Gossip of A.I. - #020"
description: ""
category:
---

# What is Gossip of A.I.

四月開始，我固定在 KKStream 內部週會時演講，長度五至十五分鐘不等。內容全是關於機器學習與人工智慧的舊聞新聞，從名人八卦到有趣的論文都有。目的有二，一是協助建立公司的資料文化，二是幫助大家成長。由於與會的同事有四成左右為非技術背景，所以內容不深，旨在宣揚目前人工智慧的進度。最近跟同事討論，覺得既然都整理這些內容了，何不寫出來讓更多人看到？所以從這篇開始寫線上版，內容會跟週會的版本相近，每一則可能會有、也可能不會有我個人的註解。前面十九份就看我有沒有心力了。另外為了順便練習英文，每段都會有中英文版，但是不保證是中英對照。

I started to share A.I. and machine learning news regularly in April 2017. Each talk is 5 ~ 15 minutes long. The contents range from gossip to interesting papers. Beside building data culture in KKStream, I also want to help colleagues gain basic knowledge about A.I.. Around 40% of the attendees are non-developers, so there is almost no difficult topics among those contents. I had a discussion with colleagues recently, and we decided to share the contents on internet. They may or may not contain my comments. Like the title says, consider this a gossip column.

---

# AI/DS Conference 2017

![](/assets/images/post-20171113-gossip-of-ai-020-07.jpg)

上週跟同事們一起去人工智慧年會跟資料科學年會。公司這次有四個講者，我也去介紹生成式對抗網路。

We attended AI/DS Conference 2017 last week. There were 4 speakers from KKBOX. I was there to talk about GANs.

---

# KKTV Data Game 17.11

[Join Us](https://www.kaggle.com/t/1594f541360d406d83cf7ec3cc57ff03)

KKTV 跟 KKstream 在 Kaggle 上共同主持一個關於資料科學的小比賽。比賽的目標是預測使用者的行為。具體來說，如果我們提個一個使用者前六個月觀影的時間記錄，你能告訴我們這個使用者未來一週可能會看影片的時間點嗎？

We are hosting an open data competition on Kaggle. The goal of this game is to better predict users' future usages. In brief, if we tell you when a user watched video in the last 6 months, can you tell us when will the user watch videos in the following week?

---

# SC2 A.I. Workshop

[Oriol Vinyals on Twitter](https://twitter.com/OriolVinyalsML/status/926466086857457665)

![](/assets/images/post-20171113-gossip-of-ai-020-00.png)

期待在圍棋之後，人工智慧也能超越電競選手！

Oriol Vinyals is from DeepMind. We all know that DeepMind is trying to build an A.I. that can defeat StarCraft professional players. Stay tight!

---

# Introducing: Unity Machine Learning Agents

[Unity Blogs](https://blogs.unity3d.com/2017/09/19/introducing-unity-machine-learning-agents/)

[![](/assets/images/post-20171113-gossip-of-ai-020-01.png)](https://youtu.be/fq0JBaiCYNA)

Unity 是一家很酷的公司，遊戲做得不好，結果把遊戲引擎推向全世界。現在他們也把觸角伸進機器學習了，遊戲確實是模擬強化學習的好方法，也更能引起人們的興趣。

Unity is a cool company and they rejected my application years ago though I match the requirement 100% (come on! who still knows about Windows COM?). Anyway, game engine is quite good on simulating the environment of reinforcement learning.

---

# The State of Data Science & Machine Learning

[Kaggle](https://www.kaggle.com/surveys/2017)

![](/assets/images/post-20171113-gossip-of-ai-020-02.png)

Kaggle 做了一個關於資料科學跟機器學習的調察，並將結果公佈在上面的連結中。除了各種數據之外，視覺化的方式也很有趣。上圖是其中一項統計：在工作中最常用到的技術。我花最多時間玩的生成式對抗網路最不實用，難怪兩次演講被問到應用面時都只能說：「你問倒我了！」

Kaggle recently had a survey on data science and machine learning. Among so many interesting topics, I found this one interests me most. I have spent a lot of my spare time on playing GANs, and it is the least practical one. In my talks of GANs, I also have said "You Got Me" twice. Fortunately, I do it for fun.

---

# The Treachery of ImageNet

[Tom White on Twitter](https://twitter.com/dribnet/status/925871135849193472)

![](/assets/images/post-20171113-gossip-of-ai-020-03.png)

雖然影相辨識有長足的進步，但是還是會在奇怪的地方失敗啊！

Image recognition failed on strange images.

---

# MoCoGAN

[GitHub](https://github.com/sergeytulyakov/mocogan)

[Sergey Tulyakov, Ming-Yu Liu, Xiaodong Yang, Jan Kautz, "MoCoGAN: Decomposing Motion and Content for Video Generation"](https://arxiv.org/abs/1707.04993)

![](/assets/images/post-20171113-gossip-of-ai-020-04.gif)

看起來是篇有趣的論文。產生臉的時候有兩個控制項：內容與動作。固定內容項並改變動作項時，產生同一個人的不同表情（縱軸）。固定動作項並改變內容項時，產生不同人的同一個表情（橫軸）。

> When fixing the content code and changing the motion code, it generated the same person performs different expressions. When fixing the motion code and changing the content code, it generated different people performs the same expression.

![](/assets/images/post-20171113-gossip-of-ai-020-05.gif)

生成式對抗網路產生的影片。

GAN generated videos.
