//
//  IndexSet+SetAlgebra.swift
//  swiftCollections-nonEmpty
//
//  Created by Dmitriy Ignatyev on 01/10/2025.
//

#if canImport(Foundation)
  public import struct Foundation.IndexSet

  extension IndexSet: SetCollection {}

  extension IndexSet: AdditiveSetAlgebraWithSelf {}

  extension IndexSet: SubtractiveResultSetAgebraWithSelf {}

  extension IndexSet: SelfSubtractiveSetAlgebraWithSelf {}

  extension IndexSet: UnorderedInsertAdditiveMutableSetAlgebra {}

  extension IndexSet: SelfSubtractingElementSetAlgebra {}

  extension IndexSet: EmptyInitializableSet {}
#endif
