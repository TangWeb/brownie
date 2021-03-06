module.exports.Util = class Util
  @type: (obj) ->
    Object::toString.call obj

  @isString: (obj) ->
    typeof obj is 'string'

  @isObject: (obj) ->
    typeof obj is 'object' and obj isnt null

  @isArray: (obj) ->
    Array.isArray obj

  @toArray: (obj) ->
    Array::slice.call obj

  @$one: (selector) ->
    document.querySelector(selector)

  @$all: (selector) ->
    @toArray document.querySelectorAll(selector)

  @aRemoveAt: (arr, index) ->
    arr.splice(index, 1)

  @aRemoveEqual: (arr, eq) ->
    for item, i in arr
      if item is eq
        arr.splice i, 1
        return

  @aInsertAfter: (arr, stuff, after) ->
    for item, i in arr
      if item is after
        arr.splice i + 1, 0, stuff
        return

  @aInsertBefore: (arr, stuff, before) ->
    for item, i in arr
      if item is before
        arr.splice i, 0, stuff
        return

  @oExtend: (dst, src) ->
    args = @toArray arguments
    target = args.shift()

    for arg in args
      if !arg
        continue

      for own k, v of arg
        if @isObject v
          if !target[k]
            target[k] = {}
          @oExtend target[k], v
        else if @isArray v
          if !target[k]
            target[k] = []
          v.forEach (v) ->
            target[k].push @clone(v)
        else
          target[k] = v

    target

  @clone: (target) ->
    if @isObject target
      return @oExtend {}, target
    else if @isArray target
      ret = []
      for v in target
        ret.push @clone(v)
      return ret
    else
      return target

  @sTrim: (str, sep = '\\s') ->
    str.replace(new RegExp('^' + sep + '+|' + sep + '+$', 'g'), '')

  @sTrimL: (str, sep = '\\s') ->
    str.replace(new RegExp('^' + sep + '+', 'g'), '')

  @sTrimR: (str, sep = '\\s') ->
    str.replace(new RegExp(sep + '+$', 'g'), '')
