/*
import 'dart:convert';
class FetchBusinessAgentModel {
  String? errorMessage;
  bool? success;
  List<Roles>? roles; //agentDetails;
  FetchBusinessAgentModel({
    this.errorMessage,
    this.success,
    this.roles,
  });

  Map<String, dynamic> toMap() {
    return {
      'errorMessage': errorMessage,
      'success': success,
      'roles': roles?.map((x) => x.toMap()).toList(),
    };
  }

  factory FetchBusinessAgentModel.fromMap(Map<String, dynamic> map) {
    return FetchBusinessAgentModel(
      errorMessage: map['errorMessage'],
      success: map['success'],
      roles: map['roles'] != null
          ? List<Roles>.from(map['roles']?.map((x) => Roles.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchBusinessAgentModel.fromJson(String source) =>
      FetchBusinessAgentModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'FetchBusinessAgentModel(errorMessage: $errorMessage, success: $success, roles: $roles)';
}

class Roles {
  String? picture;
  bool? isClient;
  bool? isAdmin;
  bool? isInfluencer;
  String? agentNickname;
  bool? routingAddress;
  String? id;
  Permissions? permissions;
  String? name;
  String? firstName;
  bool? admin;
  String? lastName;
  String? mobile;
  String? role;
  String? email;

  Roles({
    this.picture,
    this.isClient,
    this.isAdmin,
    this.isInfluencer,
    this.agentNickname,
    this.routingAddress,
    this.id,
    this.permissions,
    this.name,
    this.firstName,
    this.admin,
    this.lastName,
    this.mobile,
    this.role,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'picture': picture,
      'is_client': isClient,
      'is_admin': isAdmin,
      'is_influencer': isInfluencer,
      'agent_nickname': agentNickname,
      'routing_address': routingAddress,
      'id': id,
      'permissions': permissions?.toMap(),
      'name': name,
      'firstName': firstName,
      'admin': admin,
      'lastName': lastName,
      'mobile': mobile,
      'role': role,
      'email': email,
    };
  }

  factory Roles.fromMap(Map<String, dynamic> map) {
    return Roles(
      picture: map['picture'],
      isClient: map['is_client'],
      isAdmin: map['is_admin'],
      isInfluencer: map['is_influencer'],
      agentNickname: map['agent_nickname'],
      routingAddress: map['routing_address'],
      id: map['id'],
      permissions: map['permissions'] != null
          ? Permissions.fromMap(map['permissions'])
          : null,
      name: map['name'],
      firstName: map['firstName'],
      admin: map['admin'],
      lastName: map['lastName'],
      mobile: map['mobile'],
      role: map['role'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Roles.fromJson(String source) => Roles.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Roles(picture: $picture, isClient: $isClient, isAdmin: $isAdmin, isInfluencer: $isInfluencer, agentNickname: $agentNickname, routingAddress: $routingAddress, id: $id, permissions: $permissions, name: $name, firstName: $firstName, admin: $admin, lastName: $lastName, mobile: $mobile, role: $role, email: $email)';
  }
} */



/*
Note this is the type of model that we have used earlier-
[
    {
        "id": "1",
        "name": "Ram"
    }
]

and in api use either https://crudcrud.com/api/e3231930c4d84258ae5008cc44b9dd44/unicorns or https://crudcrud.com/api/e3231930c4d84258ae5008cc44b9dd44/test

and for deleting data from api append link with id at the last / like this https://crudcrud.com/api/e3231930c4d84258ae5008cc44b9dd44/use_id_here

and for posting use data like this -
{
        "id": "1",
        "name": "Ram"
}

if the endpoint or api is an empty array like this -[]
 */



class Model {
  String? sId;
  String? name;

  Model({this.sId, this.name});

  Model.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    // Proper Output with this code also-List toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
    //Proper Output with this code also-return data as List<dynamic>;
  }
}
