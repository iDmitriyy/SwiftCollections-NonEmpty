//
//  SetProtocol.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 25/09/2025.
//
 
public protocol SetProtocol<Element>: Collection, EmptyInitializableSet,
  SelfSubtractiveSetAlgebraWithAllSequences, SelfSubtractiveSetAlgebraWithSelf {}

public protocol UnorderedInsertSetProtocol<Element>: Collection, EmptyInitializableSet,
  SelfSubtractiveSetAlgebraWithAllSequences, SelfSubtractiveSetAlgebraWithSelf, UnorderedInsertAdditiveMutableSetAlgebra {}
