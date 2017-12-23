---
layout: post
title: "Gossip of A.I. - #021"
description: ""
category:
---

# Ironhead Wanted to be a Game Programmer

![Fake StarCraft](/assets/images/post-20171120-gossip-of-ai-021-00.jpg)

2003 年剛退伍時，我想去遊戲公司做遊戲。當時完全不會寫程式，所以找了一家補習班上課，三個月後的期末專題就是上面這張圖。當時很喜歡暴雪的遊戲，雖然幾乎沒玩星海爭霸，不過最後決定用星海爭霸的圖片做一個 2.5D 的小遊戲。把這些圖片倒出來之後，我才開始感覺到暴雪花在開發遊戲上的心力。現在已經不想寫遊戲了，反倒對用機器學習的方法玩遊戲感到興趣，或許過一陣子會再試著玩強化學習吧！

卦點：星海爭霸只有 256 色。

Back to 2003, I wanted to be a game programmer. This picture is a screenshot of my term project in a game programming class. I like Blizzard so I found tools to extract sprites of StarCraft and made a small 2.5 D shooting game. Them I admired Blizzard more after exploring those sprites. I no longer want to make games anymore, but I am interested in playing video games with A.I.. Maybe I'll try reinforcement learning again.

Fun fact: depth of those sprites is 8 bits.

---

# Learning Macromanagement in StarCraft using Deep Learning

[![Presentation](/assets/images/post-20171120-gossip-of-ai-021-01.png)](https://youtu.be/gCa5OejosYA)

[![Demo](/assets/images/post-20171120-gossip-of-ai-021-02.png)](https://youtu.be/Ps_5P8Xx3_s)

[arXiv: Learning Macromanagement in StarCraft from Replays using Deep Learning](https://arxiv.org/abs/1707.03743)

這篇論文嚐試模仿人類玩星海爭霸的生產策略。

This paper is about imitate how human players build their units.

---

# Procedural Terrain Generation with GANs

[![Presentation](/assets/images/post-20171120-gossip-of-ai-021-03.png)](https://youtu.be/mkYQnErDIOE)

[arXiv: A step towards procedural terrain generation with GANs](https://arxiv.org/abs/1707.03383)

[NASA Visible Earth](https://visibleearth.nasa.gov/view.php?id=73934)

又是生成式對抗網路，我應該更早看這段影片的，這樣就可以在人工智慧年會上提了。這篇論文做的事主要是根據兩個生成式對抗網路的模型（DCGAN + pix2pix），用來產生遊戲中的地表。訓練資料是由美國太空總署提供的高解析度地圖（高度加顏色，一個像素代表一平方公里），由第一個生成網路產生高度表，再由第二個生成網路產生對應的地貌顏色。

Use high resolution hight map and texture map (21600 x 10800, 1 square kilo-meter per pixel) provided by NASA, they trained two GANs to produce realistic terrain. The first GAN is DCGAN which receive a noise vector and generate a hight-map to fool its discriminator. The second GAN is pix2pix which try to translate the height map into texture map. The technic may be used to generate large scale realistic terrain for some game genre (maybe dog fight?).

---

# NIPS 2017: Learning to Run

![](/assets/images/post-20171120-gossip-of-ai-021-04.gif)

[GitHub: Reinforcement learning environments with musculoskeletal models](https://github.com/stanfordnmbl/osim-rl)
[crowdAI](https://www.crowdai.org/challenges/nips-2017-learning-to-run)

NIPS 2017 辦的比賽之一，目標是控制骷髏人的下半身探索世界。這是一個強化學習的問題：

* 環境：取得一個 41D 的向量。
* 動作：控制肌肉，輸出一個 18D 的向量。
* 獎勵：有移動就有分數，走得越遠分數越高，但是如果做出超人的動作會扣分（韌帶不能亂拉）。

One of NIPS 2017 competition track. The objective is to control the skeleton to explore the environment. This is a reinforcement learning problem:

* environment: In each frame, you receive a 41D vector.
* actions: According to the environment, output a 18D vector to control muscles.
* rewards: Moving in the world and the final distance get scores. Using ligament get penalty (split? :D).

---

# MariFlow - Self-Driving Mario Kart w/Recurrent Neural Network

[![](/assets/images/post-20171120-gossip-of-ai-021-05.png)](https://youtu.be/Ipi40cb_RsI)

上次 Seth Bling 用 AI 玩馬利兄弟，這次他建了另一種 AI 來模仿人類玩馬利歐賽車。他用的方法是 LSTM / TensorFlow，先錄了 50 個小時的遊戲過程來當訓練資料。網路的輸入是遊戲畫面的灰階版本，輸出則是按八個不同按鍵的機率。我覺得最有趣的地方在他怎麼解決卡關的問題。有時候 AI 會不停的往牆上移動，這時候人類導師會出場修正問題，讓遊戲能繼續進行，過程也同時被記錄下來當作新的訓練資料，最後能訓練出冠軍車手。

You probably remember somebody played Mario with neural networks, it's Seth Bling. This time he tried to build another kind of neural network to play Mario Kart. He built a recurrent neural network using TensorFlow to mimic how human played the game. The training data is 50 hours human game play records. For the LSTM, the input is gray scale video frames and the output is probabilities of pushing buttons. The most interesting part is how he handled the failed case. Sometimes the game was stuck (keep moving into the wall) and would not move forward, Seth Bling would take over the game and **recorded how human fix the problems**. Eventually, the A.I. can win the race.

---

# NeuralKart

[![](/assets/images/post-20171120-gossip-of-ai-021-06.gif)](https://youtu.be/Eo07BAsyQ24)

[GitHub: NeuralKart](https://github.com/rameshvarun/NeuralKart)

這是 CS231n 學生的期末專題！目標是用卷積網路玩賽車，但是因為他們的 AI 學習諭練資料的結果不穩定，所以在遇到問題的時候會交給另一個 AI 控制，讓時間倒退，尋找更種可能的改進方式，然後記下好的結果當作新的訓練資料。

Awesome, this is students' term project in CS231n. They want to play Mario Kart with convolutional neural network. But they found when AI learnt from human game play records, Mario was stuck sometimes. So they designed second A.I., every time when A.I. was stuck, the second A.I. would take over and search all possibilities to improve the playing. Then the searching results were recoded as new training data.

---

# Mario AI

[![](/assets/images/post-20171120-gossip-of-ai-021-07.png)](https://youtu.be/L4KBBAwF_bE)

[Github: Mario AI](https://github.com/aleju/mario-ai)

用強化學習玩馬利兄弟！DQN 是我第一個認識的強化學習方法，這個專案有趣的地方在輸入資料是遊戲畫面（像素），結果有目的性（高分）。

Play Mario with deep q-learning. [Deep Q-Learning is also the first reinforcement learning algorithm I have learnt](http://blog.ironhead.ninja/2016/09/08/openai-cartpole.html). The environment is the video frame pixels and the actions are how to control Mario. And the reward is to finish the level as soon as possible.
