---
layout: post
title: "Conway's Game of Life on CodeSkulptor"
description: ""
category:
tags: ["python", "programming"]
---

[CodeSkulptor](http://www.codeskulptor.org/#user38_iF5tSbexuT1XG1M_5.py)

{% highlight python %}
import simplegui


class GameOfLife :
  def __init__(self, col_num, row_num, cell_size, line_size = 1) :
    self._col_num = col_num
    self._row_num = row_num
    self._cell_size = cell_size
    self._line_size = line_size

    self._cells = [[0] * col_num for _ in range(row_num)]

  def get_width(self) :
    return self._col_num * (self._cell_size + self._line_size) + self._line_size

  def get_height(self) :
    return self._row_num * (self._cell_size + self._line_size) + self._line_size

  def get_color_of_cell(self, x, y) :
    return "Black" if self._cells[y][x] == 0 else "Lime"

  def get_position_of_cell(self, x, y) :
    px = x * (self._line_size + self._cell_size) + self._line_size + 1
    py = y * (self._line_size + self._cell_size) + self._line_size + 1
    ww = self._cell_size - 2

    return [(px, py),  (px + ww, py), (px + ww, py + ww), (px, py + ww)]

  def reset(self) :
    for y in range(self._row_num) :
      for x in range(self._col_num) :
        self._cells[y][x] = 0

  def toggle_cell(self, x, y) :
    self._cells[y][x] = (1 + self._cells[y][x]) % 2

  def toggle_position(self, position) :
    s = self._line_size + self._cell_size
    x = position[0] / s
    y = position[1] / s

    if x < self._col_num and y < self._row_num and x >= 0 and y >= 0 :
      self.toggle_cell(x, y)

  def update(self) :
    temp = [[0] * self._col_num for _ in range(self._row_num)]

    for y in range(self._row_num) :
      for x in range(self._col_num) :
        z  = self._cells[y - 1][x - 1]
        z += self._cells[y - 1][x]
        z += self._cells[y][x - 1]
        z += self._cells[y][x]

        xx = 0 if x + 1 == self._col_num else x + 1
        yy = 0 if y + 1 == self._row_num else y + 1

        z += self._cells[y - 1][xx]
        z += self._cells[y][xx]
        z += self._cells[yy][x - 1]
        z += self._cells[yy][x]
        z += self._cells[yy][xx]

        temp[y][x] = z

    for y in range(self._row_num) :
      for x in range(self._col_num) :
        z = temp[y][x]

        if self._cells[y][x] == 1 :
          z -= 1

        if z < 2 :
          self._cells[y][x] = 0
        elif z < 4 :
          pass
        else :
          self._cells[y][x] = 0
        elif z == 3 :
          self._cells[y][x] = 1

  def draw(self, canvas) :
    width = self.get_width()

    y = self._line_size / 2

    for _ in range(1 + self._row_num) :
      canvas.draw_line((0, y), (width, y), self._line_size, "Teal")

      y += self._cell_size + self._line_size

    height = self.get_height()

    x = self._line_size / 2

    for _ in range(1 + self._col_num) :
      canvas.draw_line((x, 0), (x, height), self._line_size, "Teal")

      x += self._cell_size + self._line_size

    for y in range(self._row_num) :
      for x in range(self._col_num) :
        color = self.get_color_of_cell(x, y)

        canvas.draw_polygon(self.get_position_of_cell(x, y), 2, color, color)

button_start = None
button_clear = None
running = False

gol = GameOfLife(20, 20, 38, 2)

def demo(name) :
  global running

  running = True

  gol.reset()

  button_start.set_text("Pause")

  patterns = {
    "toad" : [(3, 2), (4, 2), (5, 2), (2, 3), (3, 3), (4, 3)],
    "blinker" : [(4, 3), (4, 4), (4, 5)],
    "beacon" : [(1, 1), (2, 1), (1, 2), (4, 4), (4, 3), (3, 4)],
    "pulsar" : [(4, 2), (5, 2), (6, 2), (10, 2), (11, 2), (12, 2), \
    (2, 4), (2, 5), (2, 6), (7, 4), (7, 5), (7, 6), \
    (9, 4), (9, 5), (9, 6), (14, 4), (14, 5), (14, 6), \
    (4, 7), (5, 7), (6, 7), (10, 7), (11, 7), (12, 7), \
    (4, 9), (5, 9), (6, 9), (10, 9), (11, 9), (12, 9), \
    (2, 10), (2, 11), (2, 12), (7, 10), (7, 11), (7, 12), \
    (9, 10), (9, 11), (9, 12), (14, 10), (14, 11), (14, 12), \
    (4, 14), (5, 14), (6, 14), (10, 14), (11, 14), (12, 14)],
    "glider" : [(5, 5), (6, 6), (6, 7), (5, 7), (4, 7)],
    "lwss" : [(2, 2), (2, 4), (5, 2), (6, 3), (6, 4), (6, 5), (3, 5), (4, 5), (5, 5)]
  }

  map(lambda x : gol.toggle_cell(x[0], x[1]), patterns[name])

def on_mouse_clicked(position) :
  if not running :
    gol.toggle_position(position)

def on_demo_toad() :
  demo("toad")

def on_demo_blinker() :
  demo("blinker")

def on_demo_beacon() :
  demo("beacon")

def on_demo_pulsar() :
  demo("pulsar")

def on_demo_glider() :
  demo("glider")

def on_demo_lwss() :
  demo("lwss")

def on_start() :
  global running

  running = not running

  if running :
    button_start.set_text("Pause")
  else :
    button_start.set_text("Start")

def on_clear() :
  global running

  running = False

  button_start.set_text("Start")

  gol.reset()

def update_game_of_life() :
  if running :
    gol.update()

def on_draw(canvas) :
  gol.draw(canvas)

# Create a frame and assign callbacks to event handlers
frame = simplegui.create_frame("Game of Life", gol.get_width(), gol.get_height())

frame.add_button('Demo Toad', on_demo_toad)
frame.add_button('Demo Blinker', on_demo_blinker)
frame.add_button('Demo Beacon', on_demo_beacon)
frame.add_button('Demo Pulsar', on_demo_pulsar)
frame.add_button('Demo Glider', on_demo_glider)
frame.add_button('Demo LWSS', on_demo_lwss)

button_start = frame.add_button('Start', on_start)
button_clear = frame.add_button('Clear', on_clear)

frame.set_mouseclick_handler(on_mouse_clicked)
frame.set_draw_handler(on_draw)
frame.start()

# timer to update
timer = simplegui.create_timer(500, update_game_of_life)
timer.start()

on_demo_toad()
{% endhighlight %}
