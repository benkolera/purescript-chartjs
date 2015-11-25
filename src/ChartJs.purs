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

  , generateLegend

  )where

import Prelude
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
  , tooltipEvents          :: Array String
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
  { labels   :: Array String
  , datasets :: Array LineChartDataset
  }

type LineChartDataset =
  { label                :: String
  , fillColor            :: String
  , strokeColor          :: String
  , pointColor           :: String
  , pointStrokeColor     :: String
  , pointHighlightFill   :: String
  , pointHighlightStroke :: String
  , data                 :: Array Number
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
  , legendTemplate           :: String
  , pointDot                 :: Boolean
  , pointDotRadius           :: Number
  , pointDotStrokeWidth      :: Number
  , pointHitDetectionRadius  :: Number
  , datasetStroke            :: Boolean
  , datasetStrokeWidth       :: Number
  , datasetFill              :: Boolean
  }

type BarChartData =
  { labels   :: Array String
  , datasets :: Array BarChartDataset
  }

type BarChartDataset =
  { fillColor       :: String
  , strokeColor     :: String
  , highlightFill   :: String
  , highlightStroke :: String
  , data            :: Array Number
  }

type BarChartConfig =
  { global                   :: ChartConfig
  , scaleBeginAtZero         :: Boolean
  , scaleShowGridLines       :: Boolean
  , scaleGridLineColor       :: String
  , scaleGridLineWidth       :: Number
  , scaleShowHorizontalLines :: Boolean
  , scaleShowVerticalLines   :: Boolean
  , legendTemplate           :: String
  , barShowStroke            :: Boolean
  , barStrokeWidth           :: Number
  , barValueSpacing          :: Number
  , barDatasetSpacing        :: Number
  }

type RadarChartData =
  { labels   :: Array String
  , datasets :: Array RadarChartDataset
  }
type RadarChartDataset =
  { label                :: String
  , fillColor            :: String
  , strokeColor          :: String
  , pointColor           :: String
  , pointStrokeColor     :: String
  , pointHighlightFill   :: String
  , pointHighlightStroke :: String
  , data                 :: Array Number
  }
type RadarChartConfig =
  { global                  :: ChartConfig
  , scaleShowLine           :: Boolean
  , angleShowLineOut        :: Boolean
  , scaleShowLabels         :: Boolean
  , scaleBeginAtZero        :: Boolean
  , angleLineColor          :: String
  , angleLineWidth          :: Number
  , pointLabelFontFamily    :: String
  , pointLabelFontStyle     :: String
  , pointLabelFontSize      :: Number
  , pointLabelFontColor     :: String
  , legendTemplate          :: String
  , pointDot                :: Boolean
  , pointDotRadius          :: Number
  , pointDotStrokeWidth     :: Number
  , pointHitDetectionRadius :: Number
  , datasetStroke           :: Boolean
  , datasetStrokeWidth      :: Number
  , datasetFill             :: Boolean
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
  , legendTemplate         :: String
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
  , legendTemplate         :: String
  , percentageInnerCutout  :: Number
  , animateRotate          :: Boolean
  , animateScale           :: Boolean
  }

foreign import newChart :: forall eff. Context2D -> Eff ( dom :: DOM | eff ) Chart

-- Yanking Chart.defaults.global and parsing in with foreign may be
-- better
defGlobalChartConfig :: ChartConfig
defGlobalChartConfig =
  { animation: true
  , animationSteps: 60.0
  , animationEasing: "easeOutQuart"
  , showScale: true
  , scaleOverride: false
  , scaleSteps: Nothing
  , scaleStepWidth: Nothing
  , scaleStartValue: Nothing
  , scaleLineColor: "rgba(0,0,0,.1)"
  , scaleLineWidth: 1.0
  , scaleShowLabels: true
  , scaleLabel: "<%=value%>"
  , scaleIntegersOnly: true
  , scaleBeginAtZero: false
  , scaleFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif"
  , scaleFontSize: 12.0
  , scaleFontStyle: "normal"
  , scaleFontColor: "#666"
  , responsive: false
  , maintainAspectRatio: true
  , showTooltips: true
  , customTooltips: false
  , tooltipEvents: ["mousemove", "touchstart", "touchmove"]
  , tooltipFillColor: "rgba(0,0,0,0.8)"
  , tooltipFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif"
  , tooltipFontSize: 14.0
  , tooltipFontStyle: "normal"
  , tooltipFontColor: "#fff"
  , tooltipTitleFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif"
  , tooltipTitleFontSize: 14.0
  , tooltipTitleFontStyle: "bold"
  , tooltipTitleFontColor: "#fff"
  , tooltipYPadding: 6.0
  , tooltipXPadding: 6.0
  , tooltipCaretSize: 8.0
  , tooltipCornerRadius: 6.0
  , tooltipXOffset: 10.0
  , tooltipTemplate: "<%if (label){%><%=label%>: <%}%><%= value %>"
  , multiTooltipTemplate: "<%= value %>"
  , onAnimationProgress: (return unit :: Eff ( dom :: DOM ) Unit )
  , onAnimationComplete: (return unit :: Eff ( dom :: DOM ) Unit )
  }

foreign import lineChart :: forall eff.
         Chart
      -> LineChartData
      -> LineChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

defLineChartConfig :: LineChartConfig
defLineChartConfig =
  { global                   : defGlobalChartConfig
  , scaleShowGridLines       : true
  , scaleGridLineColor       : "rgba(0,0,0,.05)"
  , scaleGridLineWidth       : 1.0
  , scaleShowHorizontalLines : true
  , scaleShowVerticalLines   : true
  , bezierCurve              : true
  , bezierCurveTension       : 0.4
  , pointDot                 : true
  , pointDotRadius           : 4.0
  , pointDotStrokeWidth      : 1.0
  , pointHitDetectionRadius  : 20.0
  , datasetStroke            : true
  , datasetStrokeWidth       : 2.0
  , datasetFill              : true
  , legendTemplate           : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
  }

foreign import barChart :: forall eff.
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
  , scaleGridLineWidth       : 1.0
  , scaleShowHorizontalLines : true
  , scaleShowVerticalLines   : true
  , barShowStroke            : true
  , barStrokeWidth           : 2.0
  , barValueSpacing          : 5.0
  , barDatasetSpacing        : 1.0
  , legendTemplate           : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
  }

foreign import radarChart :: forall eff.
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
  , angleLineWidth          : 1.0
  , pointLabelFontFamily    : "'Arial'"
  , pointLabelFontStyle     : "normal"
  , pointLabelFontSize      : 10.0
  , pointLabelFontColor     : "#666"
  , pointDot                : true
  , pointDotRadius          : 3.0
  , pointDotStrokeWidth     : 1.0
  , pointHitDetectionRadius : 20.0
  , datasetStroke           : true
  , datasetStrokeWidth      : 2.0
  , datasetFill             : true
  , legendTemplate          : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
  }


foreign import polarAreaChart :: forall eff.
         Chart
      -> Array PolarAreaChartData
      -> PolarAreaChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

defPolarAreaChartConfig :: PolarAreaChartConfig
defPolarAreaChartConfig =
  { global                 : defGlobalChartConfig
    { animationSteps  = 100.0
    , animationEasing = "easeOutBounce"
    }
  , scaleShowLabelBackdrop : true
  , scaleBackdropColor     : "rgba(255,255,255,0.75)"
  , scaleBeginAtZero       : true
  , scaleBackdropPaddingY  : 2.0
  , scaleBackdropPaddingX  : 2.0
  , scaleShowLine          : true
  , segmentShowStroke      : true
  , segmentStrokeColor     : "#fff"
  , segmentStrokeWidth     : 2.0
  , animateRotate          : true
  , animateScale           : false
  , legendTemplate         : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>"
  }

foreign import doughnutChart :: forall eff.
         Chart
      -> Array DoughnutChartData
      -> PieDoughnutChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

foreign import pieChart :: forall eff.
         Chart
      -> Array PieChartData
      -> PieDoughnutChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

defPieChartConfig :: PieDoughnutChartConfig
defPieChartConfig = defPieDoughnutChartConfig 0.0

defDoughnutChartConfig :: PieDoughnutChartConfig
defDoughnutChartConfig = defPieDoughnutChartConfig 50.0

defPieDoughnutChartConfig :: Number -> PieDoughnutChartConfig
defPieDoughnutChartConfig cutout =
  { global                 : defGlobalChartConfig
    { animationSteps  = 100.0
    , animationEasing = "easeOutBounce"
    }
  , segmentShowStroke      : true
  , segmentStrokeColor     : "#fff"
  , segmentStrokeWidth     : 2.0
  , percentageInnerCutout  : cutout
  , animateRotate          : true
  , animateScale           : false
  , legendTemplate         : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>"
  }

responsiveChartConfig
  :: forall r
   . { global :: ChartConfig | r }
  -> { global :: ChartConfig | r }
responsiveChartConfig a = a { global = a.global { responsive = true } }

foreign import generateLegend :: forall eff. ChartType -> Eff ( dom :: DOM | eff ) String
