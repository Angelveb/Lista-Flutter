import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getProducto() async {
  List productos = [];
  QuerySnapshot querySnapshot = await db.collection('productos').get();
  for (var doc in querySnapshot.docs){
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    Map producto = {
      "name": data["name"],
      "uid": doc.id,
  };
  productos.add(producto);
  }
  return productos;
}

//Guardar un nuevo producto en base de datos

Future<void> addProductos(String name) async {
  await db.collection("productos").add({"name": name});
}

// Actualizar un name en base de datos
Future<void> updateProducto(String uid, String name) async {
  await db.collection("productos").doc(uid).set({"name": name});
}

// Borrar datos de Firebase
Future<void> deleteProducto(String uid) async {
  await db.collection("productos").doc(uid).delete();
}
