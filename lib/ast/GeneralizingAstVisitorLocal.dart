//GeneralizingAstVisitor
import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

class GeneralizingAstVisitorLocal extends GeneralizingAstVisitor<Map> {
  @override
  Map? visitNode(AstNode node) {
    //输出遍历AST Node 节点内容
    print("GeneralizingAstVisitorLocal: ${node.runtimeType}<---->${node.toSource()}");
    return super.visitNode(node);
  }
}
