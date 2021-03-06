; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -instcombine %s -S | FileCheck %s

@block = global [64 x [8192 x i8]] zeroinitializer, align 1

define <2 x i8*> @vectorindex1() {
; CHECK-LABEL: @vectorindex1(
; CHECK-NEXT:    ret <2 x i8*> getelementptr inbounds ([64 x [8192 x i8]], [64 x [8192 x i8]]* @block, <2 x i64> zeroinitializer, <2 x i64> <i64 1, i64 2>, <2 x i64> zeroinitializer)
;
  %1 = getelementptr inbounds [64 x [8192 x i8]], [64 x [8192 x i8]]* @block, i64 0, <2 x i64> <i64 0, i64 1>, i64 8192
  ret <2 x i8*> %1
}

define <2 x i8*> @vectorindex2() {
; CHECK-LABEL: @vectorindex2(
; CHECK-NEXT:    ret <2 x i8*> getelementptr inbounds ([64 x [8192 x i8]], [64 x [8192 x i8]]* @block, <2 x i64> zeroinitializer, <2 x i64> <i64 1, i64 2>, <2 x i64> <i64 8191, i64 1>)
;
  %1 = getelementptr inbounds [64 x [8192 x i8]], [64 x [8192 x i8]]* @block, i64 0, i64 1, <2 x i64> <i64 8191, i64 8193>
  ret <2 x i8*> %1
}

define <2 x i8*> @vectorindex3() {
; CHECK-LABEL: @vectorindex3(
; CHECK-NEXT:    ret <2 x i8*> getelementptr inbounds ([64 x [8192 x i8]], [64 x [8192 x i8]]* @block, <2 x i64> zeroinitializer, <2 x i64> <i64 0, i64 2>, <2 x i64> <i64 8191, i64 1>)
;
  %1 = getelementptr inbounds [64 x [8192 x i8]], [64 x [8192 x i8]]* @block, i64 0, <2 x i64> <i64 0, i64 1>, <2 x i64> <i64 8191, i64 8193>
  ret <2 x i8*> %1
}

define i32* @bitcast_vec_to_array_gep(<7 x i32>* %x, i64 %y, i64 %z) {
; CHECK-LABEL: @bitcast_vec_to_array_gep(
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr <7 x i32>, <7 x i32>* [[X:%.*]], i64 [[Y:%.*]], i64 [[Z:%.*]]
; CHECK-NEXT:    ret i32* [[GEP]]
;
  %arr_ptr = bitcast <7 x i32>* %x to [7 x i32]*
  %gep = getelementptr [7 x i32], [7 x i32]* %arr_ptr, i64 %y, i64 %z
  ret i32* %gep
}

define i32* @bitcast_array_to_vec_gep([3 x i32]* %x, i64 %y, i64 %z) {
; CHECK-LABEL: @bitcast_array_to_vec_gep(
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr inbounds [3 x i32], [3 x i32]* [[X:%.*]], i64 [[Y:%.*]], i64 [[Z:%.*]]
; CHECK-NEXT:    ret i32* [[GEP]]
;
  %vec_ptr = bitcast [3 x i32]* %x to <3 x i32>*
  %gep = getelementptr inbounds <3 x i32>, <3 x i32>* %vec_ptr, i64 %y, i64 %z
  ret i32* %gep
}

