//
//  SetProtocol.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 25/09/2025.
//
 
public protocol SetProtocol<Element>: SelfSubtractiveMutableSetAlgebra, EmptyInitializableSet {}

public protocol UnorderedInsertSetProtocol<Element>: UnorderedInsertAdditiveMutableSetAlgebra, EmptyInitializableSet {}
