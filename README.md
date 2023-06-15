# Anachron ZMK Config ⌛⌨️

![anachron layout](./assets/after-cleanup.png) Designed by @mkkaufmann and
@theol0403. Inspired by [urob](https://github.com/urob/zmk-config),
[callum](https://github.com/qmk/qmk_firmware/blob/master/users/callum/readme.md),
[seniply](https://stevep99.github.io/seniply/), and various layouts on
[keymapdb](https://keymapdb.com/).

## ⏰ Introduction

> **anachronism (noun.)** /əˈnæk·rəˌnɪz·əm/ : a person or a thing that is
> chronologically out of place; a chronological inconsistency.

Anachron is a keyboard layout designed for 34-key keyboards, implemented with
ZMK. It aims to provide a fast, intuitive, and cohesive typing experience. It is
similar to trilayer-based layouts such as
[callum](https://github.com/qmk/qmk_firmware/blob/master/users/callum/readme.md)
or [seniply](https://stevep99.github.io/seniply/), but provides a unique layer
design and additional features taking advantage of ZMK. The implementation has
been heavily inspired by the work of [urob](https://github.com/urob/zmk-config).

The alpha layout pictured is
[graphite](https://github.com/rdavison/graphite-layout), but anachron can be
used with any alpha layout.

## ✨ Highlights

- ⏩ timer-free layers, accelerated by **anachron combos**
- ➕ intuitive and logical **consistency of the trilayer**
- 🖱️ **one-handed mods**, shortcuts, and navigation, designed for mouse usage
- 🧮 fully-featured number pad with **easy math symbols**
- ⬆️ sticky **shift on thumb**, capsword, and numword

## 🎉 Primary Features

The left thumb and hand produce modifiers, while the right thumb and hand yield
navigation. Layers are sticky and deactivate after a timeout. Double-tapping num
enables [numword](https://github.com/urob/zmk-config#numword), and
triple-tapping toggles the num layer. A numword combo on the right hand is
available for one-handed number entry.

The left thumb's shift is sticky, and
[capsword](https://github.com/urob/zmk-config#capsword) activates via
double-tapping. Left-hand mods are sticky yet
[lazy](https://github.com/zmkfirmware/zmk/pull/1812), have a quick timeout, stay
active during key pressing, and lose stickiness after being held.

Holding both thumbs activates the trilayer, which intuitively combines the mod
and nav layers.

Extra math symbols are available with combos on the num layer. Vertical combos
are used to allow you to mash Same Finger Bigrams (SFBs) together with one
finger and have it resolve to the more common one.

Many of the features documented in urob's layout have been borrowed, including
optional timeless homerow mods (not enabled by default), intuitive mod-morphs,
swapper, repeat, space+shift, etc. Please study the layout to learn more.

## ⌛ Anachron Combos

With most callum-style layouts, there are two ways to access a key on a layer:
hold a layer key and tap the key, or tap a sticky layer key and tap the key.
However, both these methods require two separate actions that must happen
sequentially. You may be tempted to mash the layer key together with the key,
but this can lead to unintended behavior if the key is pressed slightly before
the layer key.

Anachron combos are combos that allow you to press the key _slightly_ before the
layer key and still register the correct behavior. This allows you to press any
key on a layer with a single chord. To solve edge cases, combo
[partial-holds](https://github.com/zmkfirmware/zmk/pull/1809) must be used.

This has been implemented using C helper macros in ZMK, and consists of almost a
hundred combos. Please see the keymap for more details.

## 📏 Design Principles

Anachron has been designed with a few guiding principles to make typing less
frustrating and more efficient:

### ⏲️ Eliminate Uncertainty of Timers

There are many layouts, the most popular being
[miryoku](https://github.com/manna-harbour/miryoku), that use hold-taps to
access layers and home-row mods. However, after a year of typing on such
layouts, I have found that the timers impeded my ability to feel confident in my
typing, and introduced issues. For example, you have to articulate your
keystrokes to avoid triggering a home-row hold, keypresses are delayed,
key-repeat is impeded, shifting entire words is awkward, and you need both hands
on the board.

Anachron aims for a regular keyboard feel with no interference between keys,
immediate layer activation, fast mods application, zero input lag, and no timing
constraints. There should be no speed limit or missteps related to timing or
release order.

### 🖐️ One Muscle Memory for Each Action

Each action should generally have only one method, and it should be logical. The
same muscle memory should yield the same result when possible, eliminating the
need to remember the active layer.

For instance, pressing modifiers or arrows should each have a single motion, and
combining them (on separate hands) should yield modded arrows without executing
actions separately.

### 🖱️ Facilitate One-Handed Usage

Sometimes, you don't have both hands on the keyboard. Many actions should be
achievable with one hand to accommodate instances when the other is occupied.
This includes shortcuts accessible with the left hand while the right is on the
mouse, and one-handed navigation/editing.

For example, numword is accessible with a combo on the right hand, and common
nav combos are available on the left hand num layer.

### 🛠️ Natural, Effective Features

Stealing from [leap.nvim](https://github.com/ggandor/leap.nvim):

- **80/20**: focus on features that are applicable in all contexts -
  micro-improvements to the most frequent tasks accumulate more savings than
  vanity features that turn out to be rarely needed in practice

- **Sharpen the saw**: features should feel like a natural extension to the
  core, conserving conceptual integrity, with an interplay as seamless and
  intuitive as possible. Hiding features behind unintuitive entry points ensures
  they will not be effectively used.
- **Design is making decisions**: mitigate choice paralysis for the user

In short, features should feel like they belong and not introduce any cognitive
load.

## 💻 Building

Currently, anacron requires ~8 unmerged PRs to ZMK. I am currently using my
[local](https://github.com/theol0403/zmk/tree/local) zmk fork to locally build
the layout, which is based on [urob's](https://github.com/urob/zmk/tree/main).
Follow the instructions in my fork to enable in your config.

## ✅ Todo

- add media keys
- document unique sticky mod configuration
- add programming bigram combos
