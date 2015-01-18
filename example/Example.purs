module Example where

import ChartJs
import Control.Monad.Eff
import Control.Monad.Eff.Exception
import qualified Control.Monad.JQuery as J
import Data.Maybe
import Data.Traversable
import Graphics.Canvas
import DOM

initGraphs :: forall eff. Eff( dom :: DOM , err :: Exception, canvas:: Canvas | eff ) Unit
initGraphs = void <<< J.ready $ do
  initGraph "line" initLine
  initGraph "bar" initBar
  initGraph "radar" initRadar
  initGraph "polar-area" initPolarArea
  initGraph "doughnut" initDoughnut
  initGraph "pie" initPie

initLine
  :: forall eff
   . Chart
  -> Eff ( dom :: DOM , err :: Exception, canvas:: Canvas | eff ) ChartType
initLine c =
  lineChart c lineData (responsiveChartConfig defLineChartConfig)
  where
    lineData = {
      labels : ["January","February","March","April","May","June","July"],
      datasets : [
        { label: "My First dataset"
        , fillColor : "rgba(220,220,220,0.2)"
        , strokeColor : "rgba(220,220,220,1)"
        , pointColor : "rgba(220,220,220,1)"
        , pointStrokeColor : "#fff"
        , pointHighlightFill : "#fff"
        , pointHighlightStroke : "rgba(220,220,220,1)"
        , data : [40,25,58,88,5,99,63]
        },
        {
          label: "My Second dataset",
          fillColor : "rgba(151,187,205,0.2)",
          strokeColor : "rgba(151,187,205,1)",
          pointColor : "rgba(151,187,205,1)",
          pointStrokeColor : "#fff",
          pointHighlightFill : "#fff",
          pointHighlightStroke : "rgba(151,187,205,1)",
          data : [89, 86, 20, 64, 39, 61, 30]
        }
        ]}

initBar
  :: forall eff
   . Chart
  -> Eff ( dom :: DOM , err :: Exception, canvas:: Canvas | eff ) ChartType
initBar c =
  barChart c barData (responsiveChartConfig defBarChartConfig)
  where
    barData = {
      labels : ["January","February","March","April","May","June","July"],
      datasets : [
        { fillColor : "rgba(220,220,220,0.5)"
        , strokeColor : "rgba(220,220,220,0.8)"
        , highlightFill: "rgba(220,220,220,0.75)"
        , highlightStroke: "rgba(220,220,220,1)"
        , data : [70, 92, 89, 79, 34, 64, 1]
        },
        { fillColor : "rgba(151,187,205,0.5)"
        , strokeColor : "rgba(151,187,205,0.8)"
        , highlightFill : "rgba(151,187,205,0.75)"
        , highlightStroke : "rgba(151,187,205,1)"
        , data : [24, 8, 62, 48, 84, 45, 4]
        }
        ]}

initRadar
  :: forall eff
   . Chart
  -> Eff ( dom :: DOM , err :: Exception, canvas:: Canvas | eff ) ChartType
initRadar c =
  radarChart c radarData (responsiveChartConfig defRadarChartConfig)
  where
    radarData = {
      labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
      datasets: [
        { label: "My First dataset"
        , fillColor: "rgba(220,220,220,0.2)"
        , strokeColor: "rgba(220,220,220,1)"
        , pointColor: "rgba(220,220,220,1)"
        , pointStrokeColor: "#fff"
        , pointHighlightFill: "#fff"
        , pointHighlightStroke: "rgba(220,220,220,1)"
        , data: [65,59,90,81,56,55,40]
        },
        { label: "My Second dataset"
        , fillColor: "rgba(151,187,205,0.2)"
        , strokeColor: "rgba(151,187,205,1)"
        , pointColor: "rgba(151,187,205,1)"
        , pointStrokeColor: "#fff"
        , pointHighlightFill: "#fff"
        , pointHighlightStroke: "rgba(151,187,205,1)"
        , data: [28,48,40,19,96,27,100]
        }
        ]}

initPolarArea
  :: forall eff
   . Chart
  -> Eff ( dom :: DOM , err :: Exception, canvas:: Canvas | eff ) ChartType
initPolarArea c =
  polarAreaChart c pieDoughnutData (responsiveChartConfig defPolarAreaChartConfig)

initPie
  :: forall eff
   . Chart
  -> Eff ( dom :: DOM , err :: Exception, canvas:: Canvas | eff ) ChartType
initPie c =
  pieChart c pieDoughnutData (responsiveChartConfig defPieChartConfig)

initDoughnut
  :: forall eff
   . Chart
  -> Eff ( dom :: DOM , err :: Exception, canvas:: Canvas | eff ) ChartType
initDoughnut c =
  doughnutChart c pieDoughnutData (responsiveChartConfig defDoughnutChartConfig)

pieDoughnutData = [
  { value: 300
  , color:"#F7464A"
  , highlight: "#FF5A5E"
  , label: "Red"
  },
  { value: 50
  , color: "#46BFBD"
  , highlight: "#5AD3D1"
  , label: "Green"
  },
  { value: 100
  , color: "#FDB45C"
  , highlight: "#FFC870"
  , label: "Yellow"
  },
  { value: 40
  , color: "#949FB1"
  , highlight: "#A8B3C5"
  , label: "Grey"
  },
  { value: 120
  , color: "#4D5360"
  , highlight: "#616774"
  , label: "Dark Grey"
  }]

initGraph
  :: forall eff
   . String
  -> (Chart -> Eff( dom :: DOM , err :: Exception, canvas :: Canvas | eff ) ChartType)
  -> Eff ( dom :: DOM , err :: Exception, canvas :: Canvas | eff ) Unit
initGraph name f = void $ do
  cMay  <- getCanvasElementById cId
  c     <- maybe (die $ "Could not find canvas: " <> cId) pure cMay
  ctx   <- getContext2D c
  chart <- newChart ctx
  ct    <- f chart
  lt    <- generateLegend ct
  leg   <- J.select $ "#" <> lId
  J.appendText lt leg
  where
    cId = name <> "-canvas"
    lId = name <> "-legend"

die :: forall eff a. String -> Eff( err:: Exception | eff ) a
die = error >>> throwException
