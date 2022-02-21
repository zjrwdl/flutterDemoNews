import 'dart:convert';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

class GeneralizeAstVisitorDetail extends SimpleAstVisitor<Map> {
    List<Map> accept(elements, AstVisitor visitor) {
      List<Map> list = [];
      int length = elements.length;
      for (var i = 0; i < length; i++) {
        var element = elements[i].accept(visitor);
        if (element != null) {
          list.add(elements[i].accept(visitor));
        }
      }
      return list;
    }

    @override
    Map visitCompilationUnit(CompilationUnit node) {
      print("visitCompilationUnit node.declarations is : ${node.declarations}");
      var res = {'unit': accept(node.declarations, this)};
      print("ast result: ${JsonEncoder.withIndent('  ').convert(res)}");
      return res;
    }

    @override
    Map visitTopLevelVariableDeclaration(TopLevelVariableDeclaration node) {
      return {'top': node.variables.accept(this)};
    }

    @override
    Map visitVariableDeclarationList(VariableDeclarationList node) {
      return {
        'type': node.type?.accept(this),
        'var': accept(node.variables, this)
      };
    }

    @override
    Map visitSimpleIdentifier(SimpleIdentifier node) {
      return {'identifier': node.name};
    }

    @override
    Map visitVariableDeclaration(VariableDeclaration node) {
      return {
        'name': node.name.accept(this),
        'initializer': node.initializer?.accept(this)
      };
    }

    @override
    Map visitBinaryExpression(BinaryExpression node) {
      return {
        "operator": node.operator.lexeme,
        "left": node.leftOperand.accept(this),
        "right": node.rightOperand.accept(this)
      };
    }

    @override
    Map visitIntegerLiteral(IntegerLiteral node) {
      return {'value': node.value};
    }
}
