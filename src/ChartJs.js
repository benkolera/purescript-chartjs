"use strict";

// module ChartJs

exports.newChart = function(ctx) {
    return function () {
        return new Chart(ctx);
    };
};

exports.lineChart = function(chart) {
    return function (data) {
        return function (config) {
            return function () {
                var allConf = {};
                for ( var a in config.global ) { allConf[a] = config.global[a]; }
                for ( var a in config ) {
                    if ( a !== "global" ) {
                        allConf[a] = config[a];
                    }
                }
                return chart.Line(data,allConf);
            };
        };
    };
};

exports.barChart = function(chart) {
    return function (data) {
        return function (config) {
            return function () {
                var allConf = {};
                for ( var a in config.global ) { allConf[a] = config.global[a]; }
                for ( var a in config ) {
                    if ( a !== "global" ) {
                        allConf[a] = config[a];
                    }
                }
                return chart.Bar(data,allConf);
            };
        };
    };
};

exports.radarChart = function(chart) {
    return function (data) {
        return function (config) {
            return function () {
                var allConf = {};
                for ( var a in config.global ) { allConf[a] = config.global[a]; }
                for ( var a in config ) {
                    if ( a !== "global" ) {
                        allConf[a] = config[a];
                    }
                }
                return chart.Radar(data,allConf);
            };
        };
    };
};

exports.polarAreaChart = function (chart) {
    return function (data) {
        return function (config) {
            return function () {
                var allConf = {};
                for ( var a in config.global ) { allConf[a] = config.global[a]; }
                for ( var a in config ) {
                    if ( a !== "global" ) {
                        allConf[a] = config[a];
                    }
                }
                return chart.PolarArea(data,allConf);
            };
        };
    };
};

exports.doughnutChart = function(chart) {
    return function (data) {
        return function (config) {
            return function () {
                var allConf = {};
                for ( var a in config.global ) { allConf[a] = config.global[a]; }
                for ( var a in config ) {
                    if ( a !== "global" ) {
                        allConf[a] = config[a];
                    }
                }
                return chart.Doughnut(data,allConf);
            };
        };
    };
};

exports.pieChart = function(chart) {
    return function (data) {
        return function (config) {
            return function () {
                var allConf = {};
                for ( var a in config.global ) { allConf[a] = config.global[a]; }
                for ( var a in config ) {
                    if ( a !== "global" ) {
                        allConf[a] = config[a];
                    }
                }
                return chart.Pie(data,allConf);
            };
        };
    };
};

exports.generateLegend = function(chartType) {
    return function () {
        return chartType.generateLegend();
    };
};
