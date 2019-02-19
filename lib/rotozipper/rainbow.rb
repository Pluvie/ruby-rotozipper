##
# Crea un metodo per ogni colore da poter chiamare su un'istanza di una stringa.

class String

  %i( aliceblue antiquewhite aqua aquamarine azure beige bisque blanchedalmond blue blueviolet brown burlywood
    cadetblue chartreuse chocolate coral cornflower cornsilk crimson cyan darkblue darkcyan darkgoldenrod
    darkgray darkgreen darkkhaki darkmagenta darkolivegreen darkorange darkorchid darkred darksalmon
    darkseagreen darkslateblue darkslategray darkturquoise darkviolet deeppink deepskyblue dimgray
    dodgerblue firebrick floralwhite forestgreen fuchsia gainsboro ghostwhite gold goldenrod gray
    green greenyellow honeydew hotpink indianred indigo ivory khaki lavender lavenderblush lawngreen
    lemonchiffon lightblue lightcoral lightcyan lightgoldenrod lightgray lightgreen lightpink lightsalmon
    lightseagreen lightskyblue lightslategray lightsteelblue lightyellow lime limegreen linen magenta maroon
    mediumaquamarine mediumblue mediumorchid mediumpurple mediumseagreen mediumslateblue mediumspringgreen
    mediumturquoise mediumvioletred midnightblue mintcream mistyrose moccasin navajowhite navyblue oldlace
    olive olivedrab orange orangered orchid palegoldenrod palegreen paleturquoise palevioletred papayawhip
    peachpuff peru pink plum powderblue purple rebeccapurple red rosybrown royalblue saddlebrown salmon sandybrown
    seagreen seashell sienna silver skyblue slateblue slategray snow springgreen steelblue tan teal
    thistle tomato turquoise violet webgray webgreen webmaroon webpurple wheat whitesmoke yellow yellowgreen ).each do |color|
      self.define_method color do
        Rainbow(self).send(:color, color)
      end
    end

end
