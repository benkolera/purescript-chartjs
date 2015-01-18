# Module Documentation

## Module ChartJs

### Types

    type BarChartConfig = { barDatasetSpacing :: Number, barValueSpacing :: Number, barStrokeWidth :: Number, barShowStroke :: Boolean, legendTemplate :: String, scaleShowVerticalLines :: Boolean, scaleShowHorizontalLines :: Boolean, scaleGridLineWidth :: Number, scaleGridLineColor :: String, scaleShowGridLines :: Boolean, scaleBeginAtZero :: Boolean, global :: ChartConfig }

    type BarChartData = { datasets :: [BarChartDataset], labels :: [String] }

    type BarChartDataset = { "data" :: [Number], highlightStroke :: String, highlightFill :: String, strokeColor :: String, fillColor :: String }

    data Chart :: *

    type ChartConfig = { onAnimationComplete :: Eff (dom :: DOM) Unit, onAnimationProgress :: Eff (dom :: DOM) Unit, multiTooltipTemplate :: String, tooltipTemplate :: String, tooltipXOffset :: Number, tooltipCornerRadius :: Number, tooltipCaretSize :: Number, tooltipXPadding :: Number, tooltipYPadding :: Number, tooltipTitleFontColor :: String, tooltipTitleFontStyle :: String, tooltipTitleFontSize :: Number, tooltipTitleFontFamily :: String, tooltipFontColor :: String, tooltipFontStyle :: String, tooltipFontSize :: Number, tooltipFontFamily :: String, tooltipFillColor :: String, tooltipEvents :: [String], customTooltips :: Boolean, showTooltips :: Boolean, maintainAspectRatio :: Boolean, responsive :: Boolean, scaleFontColor :: String, scaleFontStyle :: String, scaleFontSize :: Number, scaleFontFamily :: String, scaleBeginAtZero :: Boolean, scaleIntegersOnly :: Boolean, scaleLabel :: String, scaleShowLabels :: Boolean, scaleLineWidth :: Number, scaleLineColor :: String, scaleStartValue :: Maybe Number, scaleStepWidth :: Maybe Number, scaleSteps :: Maybe Number, scaleOverride :: Boolean, showScale :: Boolean, animationEasing :: String, animationSteps :: Number, animation :: Boolean }

    data ChartType :: *

    type DoughnutChartData = { highlight :: String, color :: String, label :: String, value :: Number }

    type LineChartConfig = { datasetFill :: Boolean, datasetStrokeWidth :: Number, datasetStroke :: Boolean, pointHitDetectionRadius :: Number, pointDotStrokeWidth :: Number, pointDotRadius :: Number, pointDot :: Boolean, legendTemplate :: String, bezierCurveTension :: Number, bezierCurve :: Boolean, scaleShowVerticalLines :: Boolean, scaleShowHorizontalLines :: Boolean, scaleGridLineWidth :: Number, scaleGridLineColor :: String, scaleShowGridLines :: Boolean, global :: ChartConfig }

    type LineChartData = { datasets :: [LineChartDataset], labels :: [String] }

    type LineChartDataset = { "data" :: [Number], pointHighlightStroke :: String, pointHighlightFill :: String, pointStrokeColor :: String, pointColor :: String, strokeColor :: String, fillColor :: String, label :: String }

    type PieChartData = { highlight :: String, color :: String, label :: String, value :: Number }

    type PieDoughnutChartConfig = { animateScale :: Boolean, animateRotate :: Boolean, percentageInnerCutout :: Number, legendTemplate :: String, segmentStrokeWidth :: Number, segmentStrokeColor :: String, segmentShowStroke :: Boolean, global :: ChartConfig }

    type PolarAreaChartConfig = { animateScale :: Boolean, animateRotate :: Boolean, segmentStrokeWidth :: Number, segmentStrokeColor :: String, segmentShowStroke :: Boolean, legendTemplate :: String, scaleShowLine :: Boolean, scaleBackdropPaddingX :: Number, scaleBackdropPaddingY :: Number, scaleBeginAtZero :: Boolean, scaleBackdropColor :: String, scaleShowLabelBackdrop :: Boolean, global :: ChartConfig }

    type PolarAreaChartData = { highlight :: String, color :: String, label :: String, value :: Number }

    type RadarChartConfig = { datasetFill :: Boolean, datasetStrokeWidth :: Number, datasetStroke :: Boolean, pointHitDetectionRadius :: Number, pointDotStrokeWidth :: Number, pointDotRadius :: Number, pointDot :: Boolean, legendTemplate :: String, pointLabelFontColor :: String, pointLabelFontSize :: Number, pointLabelFontStyle :: String, pointLabelFontFamily :: String, angleLineWidth :: Number, angleLineColor :: String, scaleBeginAtZero :: Boolean, scaleShowLabels :: Boolean, angleShowLineOut :: Boolean, scaleShowLine :: Boolean, global :: ChartConfig }

    type RadarChartData = { datasets :: [RadarChartDataset], labels :: [String] }

    type RadarChartDataset = { "data" :: [Number], pointHighlightStroke :: String, pointHighlightFill :: String, pointStrokeColor :: String, pointColor :: String, strokeColor :: String, fillColor :: String, label :: String }


### Values

    barChart :: forall eff. Chart -> BarChartData -> BarChartConfig -> Eff (dom :: DOM | eff) ChartType

    defBarChartConfig :: BarChartConfig

    defDoughnutChartConfig :: PieDoughnutChartConfig

    defGlobalChartConfig :: ChartConfig

    defLineChartConfig :: LineChartConfig

    defPieChartConfig :: PieDoughnutChartConfig

    defPolarAreaChartConfig :: PolarAreaChartConfig

    defRadarChartConfig :: RadarChartConfig

    doughnutChart :: forall eff. Chart -> [DoughnutChartData] -> PieDoughnutChartConfig -> Eff (dom :: DOM | eff) ChartType

    generateLegend :: forall eff. ChartType -> Eff (dom :: DOM | eff) String

    lineChart :: forall eff. Chart -> LineChartData -> LineChartConfig -> Eff (dom :: DOM | eff) ChartType

    newChart :: forall eff. Context2D -> Eff (dom :: DOM | eff) Chart

    pieChart :: forall eff. Chart -> [PieChartData] -> PieDoughnutChartConfig -> Eff (dom :: DOM | eff) ChartType

    polarAreaChart :: forall eff. Chart -> [PolarAreaChartData] -> PolarAreaChartConfig -> Eff (dom :: DOM | eff) ChartType

    radarChart :: forall eff. Chart -> RadarChartData -> RadarChartConfig -> Eff (dom :: DOM | eff) ChartType

    responsiveChartConfig :: forall r. { global :: ChartConfig | r } -> { global :: ChartConfig | r }



