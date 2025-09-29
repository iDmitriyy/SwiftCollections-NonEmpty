//
//  SetProtocol.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 25/09/2025.
//
 
public protocol SetProtocol<Element>: Collection, SelfSubtractiveMutableSetAlgebra, EmptyInitializableSet {}

public protocol UnorderedInsertSetProtocol<Element>: Collection, UnorderedInsertAdditiveMutableSetAlgebra, EmptyInitializableSet {}
