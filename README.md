# purescript-chartjs
Purescript bindings for [chartjs](http://chartjs.org).

Note that right now it doesn't allow you to:
  * Call any of the ChartType functions (update,remove,onClick,generateLegend,etc)

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
