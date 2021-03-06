if CanvasRenderingContext2D is undefined
  throw new Error('browser does not support canvas')

if window.brownie isnt undefined
  throw new Error('namespace \'brownie\' has been used by other code')

require './context2d'

window.brownie =
  Util: require('./util').Util
  Canvas: require('./canvas').Canvas
  Rect: require('./rect').Rect
  Layer: require('./layer').Layer
  keyboard: require('./keyboard')
  Matrix: require('./matrix').Matrix
  ImageLayer: require('./layer/Image').Image
  TextLayer: require('./layer/Text').Text
