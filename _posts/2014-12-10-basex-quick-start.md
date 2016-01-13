---
layout: post
title: "BaseX Quick Start"
description: ""
category:
tags: ["database"]
---

## Installation

* [brew install basex](http://brewformulas.org/Basex)
* If you want to change the datebase path, run "basexgui" in terminal and change it in preference.
* command to start server: basexserver
* command to start client: basexclient, default username and password are admin/admin.

### Create Database and Add Some Nodes

{% highlight xquery %}
(: create a database and name it "tv-shows". :)
(: attention: this command cleans the "tv-shows" database if it exist. :)
create db tv-shows

(: open the database whose name is tv-shows. :)
open tv-shows

(: add xml to the currently opened database at the path "shows". :)
add to shows <shows><show></show><show></show><show></show></shows>

(: list all database, there should be 1 resource under tv-shows database. :)
list

(: list all resources of tv-shows, :)
(: there should be 1 xml whose name is "shows". :)
list tv-shows

(: get all <show/> node under <shows></shows>. :)
(: the result should be <show/><show/><show/>. :)
xquery for $s in shows/show return $s

(: get all <show/> nodes under shows, :)
(: add a new node <name/> to each one of them. :)
xquery for $s in shows/show return insert node <name/> into $s

(: watch the content of the currently opened database :)
(: it should be like this: :)
(: <shows> :)
(:   <show><name/></show> :)
(:   <show><name/></show> :)
(:   <show><name/></show> :)
(: </shows> :)
xquery *

(: insert a new node <rating/> into the first <show/> node under <shows/>. :)
(: attention: the first element is [1], not zero based! :)
xquery insert node <rating/> into shows/show[1]

(: insert a new node <rating/> into the last <show/> node under <shows/>. :)
xquery insert node <rating/> into shows/show[last()]

(: declare that $s is the second <show/> node under <shows/>, :)
(: insert a new <rating/> node into it :)
xquery let $s := shows/show[2] return insert node <rating/> into $s

(: delete the 1st node under <shows/> :)
(: try xquery * again and you should get: :)
(: <shows>                          :)
(:   <show><name/><rating/></show>  :)
(:   <show><name/><rating/></show>  :)
(: </shows>                         :)
xquery delete node shows/show[1]

(: destroy the database "tv-shows". :)
drop db tv-shows
{% endhighlight %}


### Update a Node

{% highlight xquery %}
create db tv-shows
open tv-shows
add to shows <shows><show></show><show></show></shows>

(: add attribute 'update' with current datetime to <shows/> :)
xquery insert node attribute{'update'}{current-dateTime()} into shows

(: add attribute 'season' to shows :)
xquery insert node attribute{'seasons'}{5} into shows/show[1]
xquery insert node attribute{'seasons'}{2} into shows/show[2]

(: add node <name/> to each show :)
xquery insert node <name>Game of Thrones</name> into shows/show[1]
xquery insert node <name>Penny Dreadful</name> into shows/show[2]

(: add <star/> to "Game of Thrones" :)
xquery insert node (<star>Lena Headey</star>, <star>Peter Dinklage</star>)
  into shows/show[1]

(: add <star/> to the node whose <name/> is Penny Dreadful :)
xquery for $s in shows/show where $s/name='Penny Dreadful' return insert
  node (<star>Josh Hartnett</star>,<star>ironhead</star>) into $s

(: current contents                                 :)
(:  <shows update="2014-12-11T14:26:04.139+08:00">  :)
(:    <show seasons="5">                            :)
(:      <name>Game of Thrones</name>                :)
(:      <star>Lena Headey</star>                    :)
(:      <star>Peter Dinklage</star>                 :)
(:    </show>                                       :)
(:    <show seasons="2">                            :)
(:      <name>Penny Dreadful</name>                 :)
(:      <star>Eva Green</star>                      :)
(:      <star>Josh Hartnett</star>                  :)
(:      <star>ironhead</star>                       :)
(:    </show>                                       :)
(:  </shows>                                        :)
xquery *

(: find <show/> whose name is 'Penny Dreadful' and delete the incorrect :)
(: star node <star>ironhead</star>. :)
xquery for $x in shows/show where $x/name='Penny Dreadful'
  return delete node $x/star[.='ironhead']

(: replace a <star/> node. :)
xquery for $s in shows/show where $s/name="Penny Dreadful"
  return (replace node $s/star[.='Josh Hartnett'] with
  <star>Timothy Dalton</star>)

(: rename all <star/> node as <cast/> node :)
xquery for $s in shows/show/star return rename node $s as 'cast'

(: copy the 2nd <show/> node, modify and return it. :)
(: there is nothing happened in the original node. :)
xquery copy $temp := shows/show[2] modify (insert node
  <star>Josh Hartnett</star> into $temp) return $temp

(: should not find <star>Josh Hartnett</star> in shows/show[2] :)
xquery *

drop db tv-shows
{% endhighlight %}

### Write Function - Functional Programming

{% highlight xquery %}
(: In test database, shows resource.
  <shows>
    <show name="Game of Thrones"/>
  </shows> :)

(: To declare function in this way, namespace must be local.
  node()* is type of node.
  node-name($n) returns name of $n.
  $n/@* returns all attributes of $n.
  element { node-name($n) }{ $n/@* } clone $n :)

(: result: <show name="Game of Thrones"/> :)

xquery declare function local:clone($n as node()*) as node()* {
  element { node-name($n) }{ $n/@* }
};
let $x := doc('test/shows')/shows/show[1]
return local:clone($x)

{% endhighlight %}

### Get Elements Childlessly

{% highlight xquery %}
(: In test database, shows resource.
  <shows>
    <show name="Game of Thrones"/>
    <show name="Penny Dreadful"/>
    <movie name="The Maze Runner"/>
  </shows>
:)

(: Result:
  <root>
    <show name="Game of Thrones"/>
    <show name="Penny Dreadful"/>
    <movie name="The Maze Runner"/>
  </root>
:)

xquery declare function local:clone($n as node()*) as node()* {
  element { node-name($n) }{ $n/@* }
};
let $x := doc('test/shows')/shows/*
return <root>{
  for $c in $x return local:clone($c)
}</root>
{% endhighlight %}
