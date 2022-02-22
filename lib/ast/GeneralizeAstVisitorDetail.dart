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

    @override
    Map visitFunctionBody(FunctionBody node) {
      print("visitFunctionBody");
      return {
        "type": "FunctionBody",
      };
    }

    @override
    Map visitFunctionExpression(FunctionExpression node) {
      print("visitFunctionExpression");
      return {
        "type": "FunctionExpression",
        "typeParameters": node.typeParameters.toString(),
        'body': node.body.toString(),
      };
    }

    @override
    Map visitFunctionDeclaration(FunctionDeclaration node) {
      print("visitFunctionDeclaration");
      return {
        "type": "FunctionDeclaration",
        "body": _safeVisitNode(node.functionExpression.body),
        "parameters": node.functionExpression.parameters?.accept(this),
      };
    }

    @override
    Map visitExpression(Expression node) {
      return {
        "type": "Expression",
      };
    }

    @override
    Map visitReturnStatement(ReturnStatement node) {
      print("visitReturnStatement");
      return {
        "type": "ReturnStatement",
        "argument": _safeVisitNode(node.expression),
      };
    }

    @override
    Map visitSimpleFormalParameter(SimpleFormalParameter node) {
      print("visitSimpleFormalParameter");
      return {
        "type": "SimpleFormalParameter",
        "paramType": node.type.toString(),
        "name": node.identifier?.name,
      };
    }

    /// 遍历节点
    Map? _safeVisitNode(AstNode? node) {
      return node?.accept(this);
    }

    @override
    Map visitFormalParameterList(FormalParameterList node) {
      print("visitFormalParameterList");
      return {
        "type": "FormalParameterList",
        "parameterList": _safeVisitNodeList(node.parameters),
      };
    }

    /// 遍历节点列表
    List<Map> _safeVisitNodeList(NodeList<AstNode> nodes) {
      List<Map> maps = [];
      int size = nodes.length;
      for (int i = 0; i < size; i++) {
        var node = nodes[i];
        var res = node.accept(this);
        if (res != null) {
          maps.add(res);
        }
      }
      return maps;
    }
}
