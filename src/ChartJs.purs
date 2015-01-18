module ChartJs where

import Control.Monad.Eff
import DOM
import Graphics.Canvas

foreign import data Chart :: *
foreign import data ChartType :: *

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

type PolarAreaChartData =
  { value     :: Number
  , label     :: String
  , color     :: String
  , highlight :: String
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

data LineChartConfig = LineChartConfig
data BarChartConfig = BarChartConfig
data RadarChartConfig = RadarChartConfig
data PolarAreaChartConfig = PolarAreaChartConfig
data DoughnutChartConfig = DoughnutChartConfig
data PieChartConfig = PieChartConfig

foreign import newChart
  """
  function newChart (ctx) {
    return function () {
      return new Chart(ctx);
    }
  }
  """ :: forall eff. Context2D -> Eff ( dom :: DOM | eff ) Chart

foreign import lineChart
  """
  function lineChart (chart) {
    return function (data) {
      return function (config) {
        return function () {
          return chart.Line(data,config);
        }
      }
    }
  }
  """ :: forall eff.
         Chart
      -> LineChartData
      -> LineChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

foreign import barChart
  """
  function barChart (chart) {
    return function (data) {
      return function (config) {
        return function () {
          return chart.Bar(data,config);
        }
      }
    }
  }
  """ :: forall eff.
         Chart
      -> BarChartData
      -> BarChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

foreign import radarChart
  """
  function radarChart (chart) {
    return function (data) {
      return function (config) {
        return function () {
          return chart.Radar(data,config);
        }
      }
    }
  }
  """ :: forall eff.
         Chart
      -> RadarChartData
      -> RadarChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

foreign import polarAreaChart
  """
  function polarAreaChart (chart) {
    return function (data) {
      return function (config) {
        return function () {
          return chart.PolarArea(data,config);
        }
      }
    }
  }
  """ :: forall eff.
         Chart
      -> [PolarAreaChartData]
      -> PolarAreaChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

foreign import doughnutChart
  """
  function doughnutChart (chart) {
    return function (data) {
      return function (config) {
        return function () {
          return chart.Doughnut(data,config);
        }
      }
    }
  }
  """ :: forall eff.
         Chart
      -> [DoughnutChartData]
      -> DoughnutChartConfig
      -> Eff (dom :: DOM | eff ) ChartType

foreign import pieChart
  """
  function pieChart (chart) {
    return function (data) {
      return function (config) {
        return function () {
          return chart.Pie(data,config);
        }
      }
    }
  }
  """ :: forall eff.
         Chart
      -> [PieChartData]
      -> PieChartConfig
      -> Eff (dom :: DOM | eff ) ChartType
