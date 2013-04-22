# fonzie-responsive-grid

A pretty awesome responsive grid framework.

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

## Using Fonzie

```
@import "responsive-grid";
```

## Using Plain ol' Sass

```
@import "./components/fonzie-responsive-grid/index";
```

## Setup

You'll need to setup your grid: (These are the defaults)

```scss
// The maximum grid width
$grid-width: 960px;

// The grid font size. This is how we use ems
$grid-font-size: 16px;

// The baseline grid
$grid-baseline: 22px;

// The total number of columns
$grid-columns: 12;

// The total size of the gutters
$grid-gutter: 20px;

// The spacing class sizes that will be created
// These will be converted to ems
$grid-spacing: 10px 20px 40px;

// The columns at which breakpoints will occur
$grid-breakpoints: 4 6 8 10 12;

// Set which type of spacing classes will be created based on $grid-spacing
$grid-margin-classes: true;
$grid-padding-classes: true;
```

And then include it: (This is so that it doesn't matter which order you declare the variables)

```
@include responsive-grid-classes;
```

There are some additional variables you can set:

```
// So you can have two stylesheets, one for IE and one for good browsers
$has-media-queries: true;

// The fallback class you can use in the breakpoint mixin to 
// target browsers without media queries
$media-query-fallback: '.lt-ie9';
```

## Usage

The `responsive-grid-classes` include will create a bunch of classes for constructing
grids using just the HTML.

### With no media queries

#### Option 1: Build two files

Since IE8 doesn't support media queries and we unfortunately need to keep supporting it, you
can build a seperate stylesheet for browsers that don't support media queries.

Lets say the main entry point for your styles is `index.scss` and this file imports everything
else, you'll need to make a another file that imports `index.scss` but adjusts some variables:

```
$has-media-queries: false;
$grid-fallback-breakpoint: 12;
@import 'index.scss';
```

This won't output any of the media queries. Any time you use the `breakpoint` mixin it will only
output content if you target `12` columns and it won't be wrapped in a media query. This makes
your layout work as if there was only a 12 column layout.

In your HTML, you'll just need to import each of them using conditional comments or using something
like Modernizr:

```
Modernizr.load({
  test: Modernizr.mediaqueries,
  nope: 'build/build-no-mq.css',
  yep: 'build/build.css'
});
```

#### Option 2: Use a fallback class

Alternatively you can set a fallback classs and just send IE the same file.

```
$grid-fallback-class: '.no-mediaqueries';
$grid-fallback-breakpoint: 12;
```

Any time you target a 12 column breakpoint, it will also output the content for
that inside of a `no-mediaqueries` block.

```
body {
  @include breakpoint(12) {
    background: red;
  }
}
```

Would output:

```
@media (max-width: 60em) {
  body {
    background: red;    
  }
}
.no-mediaqueries body {
  background: red;
}
```

This allows you to do fallback. You can also force it to fallback regardless of the columns targeted:

```
@include breakpoint(6, $fallback: true) {
  background: blue;
}
```