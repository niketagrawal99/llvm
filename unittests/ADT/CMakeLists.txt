set(LLVM_LINK_COMPONENTS
  Support
  )

add_llvm_unittest(ADTTests
  APFloatTest.cpp
  APIntTest.cpp
  APSIntTest.cpp
  ArrayRefTest.cpp
  BitmaskEnumTest.cpp
  BitVectorTest.cpp
  BreadthFirstIteratorTest.cpp
  BumpPtrListTest.cpp
  DAGDeltaAlgorithmTest.cpp
  DeltaAlgorithmTest.cpp
  DenseMapTest.cpp
  DenseSetTest.cpp
  DepthFirstIteratorTest.cpp
  EquivalenceClassesTest.cpp
  FoldingSet.cpp
  FunctionRefTest.cpp
  HashingTest.cpp
  IListBaseTest.cpp
  IListIteratorTest.cpp
  IListNodeBaseTest.cpp
  IListNodeTest.cpp
  IListSentinelTest.cpp
  IListTest.cpp
  ImmutableMapTest.cpp
  ImmutableSetTest.cpp
  IntEqClassesTest.cpp
  IntervalMapTest.cpp
  IntrusiveRefCntPtrTest.cpp
  IteratorTest.cpp
  MakeUniqueTest.cpp
  MappedIteratorTest.cpp
  MapVectorTest.cpp
  OptionalTest.cpp
  PackedVectorTest.cpp
  PointerEmbeddedIntTest.cpp
  PointerIntPairTest.cpp
  PointerSumTypeTest.cpp
  PointerUnionTest.cpp
  PostOrderIteratorTest.cpp
  PriorityWorklistTest.cpp
  RangeAdapterTest.cpp
  SCCIteratorTest.cpp
  STLExtrasTest.cpp
  ScopeExitTest.cpp
  SequenceTest.cpp
  SetVectorTest.cpp
  SimpleIListTest.cpp
  SmallPtrSetTest.cpp
  SmallStringTest.cpp
  SmallVectorTest.cpp
  SparseBitVectorTest.cpp
  SparseMultiSetTest.cpp
  SparseSetTest.cpp
  StatisticTest.cpp
  StringExtrasTest.cpp
  StringMapTest.cpp
  StringRefTest.cpp
  StringSwitchTest.cpp
  TinyPtrVectorTest.cpp
  TripleTest.cpp
  TwineTest.cpp
  VariadicFunctionTest.cpp
  )

add_dependencies(ADTTests intrinsics_gen)
