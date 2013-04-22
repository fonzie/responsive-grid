# fonzie-responsive-grid

A pretty awesome responsive grid framework. How's this different from other frameworks? Well, this one builds
breakpoints based on a grid. Lets say you have a 12 column grid, 960px wide, we can create breakpoints at columns
4, 6, 8, 12. The framework will generate classes for building layouts, spacing classes and comes with a bunch
of mixins as well.

* Build a fluid grid based on variables
* Mobile-first
* Divide the grid at columns in breakpoints
* Build responsive layouts entirely with classes
* Use customizable and responsive spacing classes
* Mixins and functions for building layouts in Sass
* Fallbacks for browsers with no media query support
* All based on percentages and ems
* Responsive visiblity helper classes to show/hide content at breakpoints
* Expose breakpoints to allow the JS modules to emit events at breakpoints
* Multiple ways to provide fallbacks
* Really simple API

## Installation

```
bower install fonzie-responsive-grid
```

## Using Sass

```
@import "./components/fonzie-responsive-grid/index";
```

Or if you add an import path to `./components/fonzie-responsive-grid` you can just do:

```
@import "responsive-grid";
```

## Setup

You'll need to setup your grid: (These are the defaults)

```scss
// The maximum grid width
$rg-width: 960px;

// The grid font size. This is how we use ems
$rg-font-size: 16px;

// The total number of columns
$rg-columns: 12;

// The columns at which breakpoints will occur
$rg-breakpoints: 4 6 8 10 12;
```

## Usage

The `responsive-grid` include will create a bunch of classes for constructing
grids using just the HTML.

```
@include responsive-grid;
```

You can also pass through a couple of variables:

```
@include responsive-grid($spacing: 5px 10px 20px, $layout: false);
```

This will use `5px`, `10px` and `15px` as the spacing sizes and disable the layout classes. Check `index.scss` for the rest of the parameters.

### Layout Classes

### Spacing Classes

### Visibilty Classes

### Mixins

### Fallbacks

If there is only a single breakpoint, we'll assume that it's a fallback. So make a seperate
stylesheet for browsers that don't do media queries and set the breakpoints to just one point.

```
$rg-breakpoints: 12;
```