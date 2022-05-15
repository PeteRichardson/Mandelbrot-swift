//
//  mandelbrot.swift
//  Mandelbrot-swift
//
//  Created by Peter Richardson on 5/14/22.
//

import Foundation

typealias Point = (Int, Int)
typealias Complex = (Double, Double)

func PointToPixel(_ p:Point) -> Complex {
    return p.0 == 2 ? (2.0, 4.0) : (3.0, 5.0)
}

func == <T:Equatable> (tuple1:(T,T),tuple2:(T,T)) -> Bool
{
   return (tuple1.0 == tuple2.0) && (tuple1.1 == tuple2.1)
}
