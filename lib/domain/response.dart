
//vai os campos do json de retorno
class Response {
  final String status;
  final String msg;

  Response(this.status, this.msg);

  // lista de inicialização que vai preencher o method constructor do objeto
  Response.fromJson(Map<String,dynamic> map):
    status = map["status"],
    msg = map["msg"];

  bool isOk(){
    return status == "OK";
  }




}