module ChartJs
  ( Chart()
  , ChartType()
  , ChartConfig()
  , LineChartData()
  , LineChartDataset()
  , LineChartConfig()
  , BarChartData()
  , BarChartDataset()
  , BarChartConfig()
  , RadarChartData()
  , RadarChartDataset()
  , RadarChartConfig()
  , PolarAreaChartData()
  , PolarAreaChartConfig()
  , PieChartData()
  , DoughnutChartData()
  , PieDoughnutChartConfig()

  , newChart
  , lineChart
  , barChart
  , radarChart
  , polarAreaChart
  , pieChart
  , doughnutChart

  , defGlobalChartConfig
  , defLineChartConfig
  , defBarChartConfig
  , defRadarChartConfig
  , defPolarAreaChartConfig
  , defPieChartConfig
  , defDoughnutChartConfig
  , responsiveChartConfig
  )where

import Control.Monad.Eff
import Data.Maybe
import DOM
import Graphics.Canvas

foreign import data Chart :: *
foreign import data ChartType :: *

type ChartConfig =
  { animation              :: Boolean
  , animationSteps         :: Number
  , animationEasing        :: String
  , legendTemplate         :: String
  , showScale              :: Boolean
  , scaleOverride          :: Boolean
  , scaleSteps             :: Maybe Number
  , scaleStepWidth         :: Maybe Number
  , scaleStartValue        :: Maybe Number
  , scaleLineColor         :: String
  , scaleLineWidth         :: Number
  , scaleShowLabels        :: Boolean
  , scaleLabel             :: String
  , scaleIntegersOnly      :: Boolean
  , scaleBeginAtZero       :: Boolean
  , scaleFontFamily        :: String
  , scaleFontSize          :: Number
  , scaleFontStyle         :: String
  , scaleFontColor         :: String
  , responsive             :: Boolean
  , maintainAspectRatio    :: Boolean
  , showTooltips           :: Boolean
  , customTooltips         :: Boolean
  , tooltipEvents          :: [String]
  , tooltipFillColor       :: String
  , tooltipFontFamily      :: String
  , tooltipFontSize        :: Number
  , tooltipFontStyle       :: String
  , tooltipFontColor       :: String
  , tooltipTitleFontFamily :: String
  , tooltipTitleFontSize   :: Number
  , tooltipTitleFontStyle  :: String
  , tooltipTitleFontColor  :: String
  , tooltipYPadding        :: Number
  , tooltipXPadding        :: Number
  , tooltipCaretSize       :: Number
  , tooltipCornerRadius    :: Number
  , tooltipXOffset         :: Number
  , tooltipTemplate        :: String
  , multiTooltipTemplate   :: String
  , onAnimationProgress    :: Eff ( dom :: DOM ) Unit
  , onAnimationComplete    :: Eff ( dom :: DOM ) Unit
  }

type LineChartData =
  { labels   :: [String]
  , datasets :: [LineChartDataset]
  }

type LineChartDataset =
  { label                :: String
  , fillColor            :: String
  , strokeColor          :: String
  , pointColor           :: String
  , pointStrokeColor     :: String
  , pointHighlightFill   :: String
  , pointHighlightStroke :: String
  , data                 :: [Number]
  }

type LineChartConfig =
  { global                   :: ChartConfig
  , scaleShowGridLines       :: Boolean
  , scaleGridLineColor       :: String
  , scaleGridLineWidth       :: Number
  , scaleShowHorizontalLines :: Boolean
  , scaleShowVerticalLines   :: Boolean
  , bezierCurve              :: Boolean
  , bezierCurveTension       :: Number
  , pointDot                 :: Boolean
  , pointDotRadius           :: Number
  , pointDotStrokeWidth      :: Number
  , pointHitDetectionRadius  :: Number
  , datasetStroke            :: Boolean
  , datasetStrokeWidth       :: Number
  , datasetFill              :: Boolean
  }

type BarChartData =
  { labels   :: [String]
  , datasets :: [BarChartDataset]
  }

type BarChartDataset =
  { fillColor       :: String
  , strokeColor     :: String
  , highlightFill   :: String
  , highlightStroke :: String
  , data            :: [Number]
  }

type BarChartConfig =
  { global                   :: ChartConfig
  , scaleBeginAtZero         :: Boolean
  , scaleShowGridLines       :: Boolean
  , scaleGridLineColor       :: String
  , scaleGridLineWidth       :: Number
  , scaleShowHorizontalLines :: Boolean
  , scaleShowVerticalLines   :: Boolean
  , barShowStroke            :: Boolean
  , barStrokeWidth           :: Number
  , barValueSpacing          :: Number
  , barDatasetSpacing        :: Number
  }

type RadarChartData =
  { labels   :: [String]
  , datasets :: [RadarChartDataset]
  }
type RadarChartDataset =
  { label                :: String
  , fillColor            :: String
  , strokeColor          :: String
  , pointColor           :: String
  , pointStrokeColor     :: String
  , pointHighlightFill   :: String
  , pointHighlightStroke :: String
  , data                 :: [Number]
  }
type RadarChartConfig =
  { global                   :: ChartConfig
  , scaleShowLine            :: Boolean
  , angleShowLineOut         :: Boolean
  , scaleShowLabels          :: Boolean
  , scaleBeginAtZero         :: Boolean
  , angleLineColor :: String
  , angleLineWidth :: Number
  , pointLabelFontFamily :: String
  , pointLabelFontStyle :: String
  , pointLabelFontSize :: Number
  , pointLabelFontColor :: String
  , pointDot :: Boolean
  , pointDotRadius :: Number
  , pointDotStrokeWidth :: Number
  , pointHitDetectionRadius :: Number
  , datasetStroke :: Boolean
  , datasetStrokeWidth :: Number
  , datasetFill :: Boolean
  }

type PolarAreaChartData =
  { value     :: Number
  , label     :: String
  , color     :: String
  , highlight :: String
  }

type PolarAreaChartConfig =
  { global                 :: ChartConfig
  , scaleShowLabelBackdrop :: Boolean
  , scaleBackdropColor     :: String
  , scaleBeginAtZero       :: Boolean
  , scaleBackdropPaddingY  :: Number
  , scaleBackdropPaddingX  :: Number
  , scaleShowLine          :: Boolean
  , segmentShowStroke      :: Boolean
  , segmentStrokeColor     :: String
  , segmentStrokeWidth     :: Number
  , animateRotate          :: Boolean
  , animateScale           :: Boolean
  }

type DoughnutChartData =
  { value     :: Number
  , label     :: String
  , color     :: String
  , highlight :: String
  }

type PieChartData =
  { value     :: Number
  , label     :: String
  , color     :: String
  , highlight :: String
  }

type PieDoughnutChartConfig =
  { global :: ChartConfig
  , segmentShowStroke      :: Boolean
  , segmentStrokeColor     :: String
  , segmentStrokeWidth     :: Number
  , percentageInnerCutout  :: Number
  , animateRotate          :: Boolean
  , animateScale           :: Boolean
  }

foreign import newChart
  """
  function newChart (ctx) {
    return function () {
      return new Chart(ctx);
    }
  }
  """ :: forall eff. Context2D -> Eff ( dom :: DOM | eff ) Chart

-- Yanking Chart.defaults.global and parsing in with foreign may be
-- better
defGlobalChartConfig :: ChartConfig
defGlobalChartConfig =
  { animation: true
  , animationSteps: 60
  , animationEasing: "easeOutQuart"
  , showScale: true
  , scaleOverride: false
  , scaleSteps: Nothing
  , scaleStepWidth: Nothing
  , scaleStartValue: Nothing
  , scaleLineColor: "rgba(0,0,0,.1)"
  , scaleLineWidth: 1
  , scaleShowLabels: true
  , scaleLabel: "<%=value%>"
  , scaleIntegersOnly: true
  , scaleBeginAtZero: false
  , scaleFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif"
  , scaleFontSize: 12
  , scaleFontStyle: "normal"
  , scaleFontColor: "#666"
  , responsive: false
  , maintainAspectRatio: true
  , showTooltips: true
  , customTooltips: false
  , tooltipEvents: ["mousemove", "touchstart", "touchmove"]
  , tooltipFillColor: "rgba(0,0,0,0.8)"
  , tooltipFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif"
  , tooltipFontSize: 14
  , tooltipFontStyle: "normal"
  , tooltipFontColor: "#fff"
  , tooltipTitleFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif"
  , tooltipTitleFontSize: 14
  , tooltipTitleFontStyle: "bold"
  , tooltipTitleFontColor: "#fff"
  , tooltipYPadding: 6
  , tooltipXPadding: 6
  , tooltipCaretSize: 8
  , tooltipCornerRadius: 6
  , tooltipXOffset: 10
  , tooltipTemplate: "<%if (label){%><%=label%>: <%}%><%= value %>"
  , multiTooltipTemplate: "<%= value %>"
  , onAnimationProgress: (return unit :: Eff ( dom :: DOM ) Unit )
  , onAnimationComplete: (return unit :: Eff ( dom :: DOM ) Unit )
  , legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
  }

foreign import lineChart
  """
  function lineChart (chart) {
    return function (data) {
      return function (config) {
        return function () {
          var allConf = {};
          for ( var a in config.global ) { allConf[a] = config.global[a] }
          for ( var a in config ) {
            if ( a !== "global" ) {
              allConf[a] = config[a];
            }
          }
          return chart.Line(data,allConf);
        }
      }
    }
  }
  """ :: forall eff.
         Chart
      -> LineChartData
      -> LineChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

defLineChartConfig :: LineChartConfig
defLineChartConfig =
  { global             : defGlobalChartConfig
  , scaleShowGridLines : true
  , scaleGridLineColor : "rgba(0,0,0,.05)"
  , scaleGridLineWidth : 1
  , scaleShowHorizontalLines: true
  , scaleShowVerticalLines: true
  , bezierCurve : true
  , bezierCurveTension : 0.4
  , pointDot : true
  , pointDotRadius : 4
  , pointDotStrokeWidth : 1
  , pointHitDetectionRadius : 20
  , datasetStroke : true
  , datasetStrokeWidth : 2
  , datasetFill : true
  }

foreign import barChart
  """
  function barChart (chart) {
    return function (data) {
      return function (config) {
        return function () {
          var allConf = {};
          for ( var a in config.global ) { allConf[a] = config.global[a] }
          for ( var a in config ) {
            if ( a !== "global" ) {
              allConf[a] = config[a];
            }
          }
          return chart.Bar(data,allConf);
        }
      }
    }
  }
  """ :: forall eff.
         Chart
      -> BarChartData
      -> BarChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

defBarChartConfig :: BarChartConfig
defBarChartConfig =
  { global                   : defGlobalChartConfig
  , scaleBeginAtZero         : true
  , scaleShowGridLines       : true
  , scaleGridLineColor       : "rgba(0,0,0,.05)"
  , scaleGridLineWidth       : 1
  , scaleShowHorizontalLines : true
  , scaleShowVerticalLines   : true
  , barShowStroke            : true
  , barStrokeWidth           : 2
  , barValueSpacing          : 5
  , barDatasetSpacing        : 1
  }

foreign import radarChart
  """
  function radarChart (chart) {
    return function (data) {
      return function (config) {
        return function () {
          var allConf = {};
          for ( var a in config.global ) { allConf[a] = config.global[a] }
          for ( var a in config ) {
            if ( a !== "global" ) {
              allConf[a] = config[a];
            }
          }
          return chart.Radar(data,allConf);
        }
      }
    }
  }
  """ :: forall eff.
         Chart
      -> RadarChartData
      -> RadarChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

defRadarChartConfig :: RadarChartConfig
defRadarChartConfig =
  { global                  : defGlobalChartConfig
  , scaleShowLine           : true
  , angleShowLineOut        : true
  , scaleShowLabels         : false
  , scaleBeginAtZero        : true
  , angleLineColor          : "rgba(0,0,0,.1)"
  , angleLineWidth          : 1
  , pointLabelFontFamily    : "'Arial'"
  , pointLabelFontStyle     : "normal"
  , pointLabelFontSize      : 10
  , pointLabelFontColor     : "#666"
  , pointDot                : true
  , pointDotRadius          : 3
  , pointDotStrokeWidth     : 1
  , pointHitDetectionRadius : 20
  , datasetStroke           : true
  , datasetStrokeWidth      : 2
  , datasetFill             : true
  }


foreign import polarAreaChart
  """
  function polarAreaChart (chart) {
    return function (data) {
      return function (config) {
        return function () {
          var allConf = {};
          for ( var a in config.global ) { allConf[a] = config.global[a] }
          for ( var a in config ) {
            if ( a !== "global" ) {
              allConf[a] = config[a];
            }
          }
          return chart.PolarArea(data,allConf);
        }
      }
    }
  }
  """ :: forall eff.
         Chart
      -> [PolarAreaChartData]
      -> PolarAreaChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

defPolarAreaChartConfig :: PolarAreaChartConfig
defPolarAreaChartConfig =
  { global                 : defGlobalChartConfig
    { animationSteps  = 100
    , animationEasing = "easeOutBounce"
    }
  , scaleShowLabelBackdrop : true
  , scaleBackdropColor     : "rgba(255,255,255,0.75)"
  , scaleBeginAtZero       : true
  , scaleBackdropPaddingY  : 2
  , scaleBackdropPaddingX  : 2
  , scaleShowLine          : true
  , segmentShowStroke      : true
  , segmentStrokeColor     : "#fff"
  , segmentStrokeWidth     : 2
  , animateRotate          : true
  , animateScale           : false
  }

foreign import doughnutChart
  """
  function doughnutChart (chart) {
    return function (data) {
      return function (config) {
        return function () {
          var allConf = {};
          for ( var a in config.global ) { allConf[a] = config.global[a] }
          for ( var a in config ) {
            if ( a !== "global" ) {
              allConf[a] = config[a];
            }
          }
          return chart.Doughnut(data,allConf);
        }
      }
    }
  }
  """ :: forall eff.
         Chart
      -> [DoughnutChartData]
      -> PieDoughnutChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

foreign import pieChart
  """
  function pieChart (chart) {
    return function (data) {
      return function (config) {
        return function () {
          var allConf = {};
          for ( var a in config.global ) { allConf[a] = config.global[a] }
          for ( var a in config ) {
            if ( a !== "global" ) {
              allConf[a] = config[a];
            }
          }
          return chart.Pie(data,allConf);
        }
      }
    }
  }
  """ :: forall eff.
         Chart
      -> [PieChartData]
      -> PieDoughnutChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

defPieChartConfig :: PieDoughnutChartConfig
defPieChartConfig = defPieDoughnutChartConfig 0

defDoughnutChartConfig :: PieDoughnutChartConfig
defDoughnutChartConfig = defPieDoughnutChartConfig 50

defPieDoughnutChartConfig :: Number -> PieDoughnutChartConfig
defPieDoughnutChartConfig cutout =
  { global                 : defGlobalChartConfig
    { animationSteps  = 100
    , animationEasing = "easeOutBounce"
    }
  , segmentShowStroke      : true
  , segmentStrokeColor     : "#fff"
  , segmentStrokeWidth     : 2
  , percentageInnerCutout  : cutout
  , animateRotate          : true
  , animateScale           : false
  }

responsiveChartConfig
  :: forall r
   . { global :: ChartConfig | r }
  -> { global :: ChartConfig | r }
responsiveChartConfig a = a { global = a.global { responsive = true } }
