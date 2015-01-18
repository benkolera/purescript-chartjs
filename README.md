# purescript-chartjs
Purescript bindings for [chartjs](http://chartjs.org).

It also packages a [css file](chartjs.css) that covers the default
legend templates since chartjs doesn't seem to provide that in its
bower distribution.

Note that right now it doesn't:
  * Have all of the ChartType functions (update,remove,onClick,etc)
  * Be proven to work with all configurations.

## Installation
```
bower install --save purescript-chartjs
```

## Documentation

View the module documentation [here](MODULES.md).

## Example Usage

Check out the [example](example/) directory for an example usage.

If you have this checked out locally you can just open your browser
at the example/index.html on your local file system.

If you want to change the example purescript, you'll need gulp. Check
out the repo and in the root run:

```
npm install -g gulp
npm install
bower install
gulp watch-browser
```

Then open up example/index.html in your browser. Any changes will
force a recompile of example.js which you'll need to refresh the page
in your browser to see your changes.
