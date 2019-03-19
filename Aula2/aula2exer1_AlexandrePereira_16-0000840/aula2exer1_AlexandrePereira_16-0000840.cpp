#include <bits/stdc++.h>
#include <iostream>
#include <fstream>

using namespace std;

class Pessoa{

  private:
    string name;
    unsigned long long int cpf;
    unsigned int number_of_cars;


  public:

    //Sobrescrita do método construtor
    Pessoa(string name, unsigned long long int cpf, unsigned int number_of_cars){
      this->name = name;
      this->cpf = cpf;
      this->number_of_cars =  number_of_cars;
    }

    // Operador <
    bool operator<(const Pessoa &p) const {
      return cpf > p.cpf;
    }

    //Métodos do Name
    void setName(string name){
      this->name = name;
    }
    string getName(){
      return name;
    }

    //Métodos do CPF
    void setCpf(unsigned long long int cpf){
      this->cpf = cpf;
    }
    unsigned long long int getCpf(){
      return cpf;
    }

    //Métodos do Número de Carros
    void setNumberOfCars(unsigned int number_of_cars){
      this->number_of_cars = number_of_cars;
    }
    unsigned int getNumberOfCars(){
      return number_of_cars;
    }



};

class Car{

  private:
    string plate;
    string model;
    string color;
    unsigned long long int owner_cpf;

  public:

    //Sobrescrita do Método Construtor
    Car(string plate, string model, string color, unsigned long long int owner_cpf){
      this->plate = plate;
      this->model = model;
      this->color = color;
      this->owner_cpf = owner_cpf;
    }

    // Operador <
    bool operator<(const Car &c) const {
      return plate < c.plate;
    }

    //Métodos da Placa
    void setPlate(string plate){
      this->plate = plate;
    }
    string getPlate(){
      return plate;
    }

    //Métodos do Model
    void setModel(string model){
      this->model = model;
    }
    string getModel(){
      return model;
    }

    //Métodos da Color
    void setColor(string color){
      this->color = color;
    }
    string getColor(){
      return color;
    }

    //Métodos do Cpf Do Dono
    void setOwnerCpf(unsigned long long int owner_cpf){
      this->owner_cpf = owner_cpf;
    }
    unsigned long long int getOwnerCpf(){
      return owner_cpf;
    }

};

void menu_inicial();

int main(){

  //Seletor da opção
  char selector = '&';

  //Mostra Menu inicial
  menu_inicial();

  ofstream user_db("users.txt", fstream::out | fstream::app);
  ofstream car_db("cars.txt", fstream::out | fstream::app);
  user_db.close();
  car_db.close();

  while(selector != '7'){

    //Sets a serem utilizados
    set<Pessoa> users;
    set<Car> cars;

    //Monta o set de Pessoas
    ifstream user_db_in("users.txt", fstream::in);
    while(!user_db_in.eof()){
      unsigned long long int cpf;
      string name;
      unsigned int number_of_cars;

      user_db_in >> cpf;
      user_db_in >> name;
      user_db_in >> number_of_cars;

      Pessoa person(name, cpf, number_of_cars);
      users.insert(person);
    }
    user_db_in.close();

    //Monta o set de Carros
    ifstream cars_db_in("cars.txt", fstream::in);
    while(!cars_db_in.eof()){
      string plate;
      string model;
      string color;
      unsigned long long int owner_cpf;

      cars_db_in >> owner_cpf;
      cars_db_in >> plate;
      cars_db_in >> model;
      cars_db_in >> color;


      Car vehicle(plate, model, color, owner_cpf);
      cars.insert(vehicle);
    }
    cars_db_in.close();




    //Variáveis Auxiliadoras
    string aux_string;
    unsigned long long int aux_int;
    cin >> selector;

    if(selector == '1'){

      // if(is_empty(cars_db)){
      //   cout << "Não existem carros cadastrados no Banco De Dados. Escolha outra opção." << endl;
      // }
      // else{
      //
      //
      // }
      int cont = 1;
      for(auto item: users){
        cout << "Usuário Número " << cont << endl;
        cout << "Nome do usuário com for auto: " + item.getName() << endl;
        cout << "CPF do usuário com for auto: " << item.getCpf() << endl;
        cout << "Número de carros do usuário com for auto: " << item.getNumberOfCars() << endl;
        cout << endl;
        cont++;
      }
    }

    else if(selector == '2'){
      cout << "Digite o CPF do Usuário: ";
      cin >> aux_int;

      for(auto item: users){
        if(item.getCpf() == aux_int){

          cout << "Nome do usuário com for auto: " + item.getName() << endl;
          cout << "CPF do usuário com for auto: " + item.getCpf() << endl;
          cout << "Número de carros do usuário com for auto: " << item.getNumberOfCars() << endl;

        }
      }


    }

    else if(selector == '3'){

      cout << "Inserir Novo Usuário" << endl;
      unsigned int aux_number_of_cars = 0;
      bool flag = false;
      //Verifica se o CPF já não foi Cadastrado
      while(!flag){
        cout << "Digite o CPF do Usuário (Somente Números): ";
        cin >> aux_int;
        flag = true;
        for(auto item: users){
          if(item.getCpf() == aux_int){
            flag = false;
            cout << "Usuário Já Cadastrado." << endl;
          }
        }
      }
      cout << "Digite o Nome do Usuário: ";
      cin >> aux_string;
      cout << "Digite o Número de Carros do Usuário: ";
      cin >> aux_number_of_cars;

      Pessoa user(aux_string, aux_int, aux_number_of_cars);
      users.insert(user);

      cout << endl << "Inserir Carros de Usuário" << endl;

      unsigned long long int cont = 0;
      string plate;
      string model;
      string color;

      for(cont = 0; cont < aux_number_of_cars; cont++){
        bool flag_plate = false;
        cout << "Dados do " << cont+1 << "° Carro:" << endl;
        while(!flag_plate){
          cout << "Placa: ";
          cin >> plate;
          flag_plate = true;
          for(auto item: cars){
            if(item.getPlate() == plate){
              flag_plate = false;
              cout << "Carro Já Cadastrado." << endl;
            }
          }
        }
        cout << "Modelo: ";
        cin >> model;
        cout << "Cor: ";
        cin >> color;
        cout << endl;

        Car vehicle(plate, color, model, aux_int);
        cars.insert(vehicle);
      }


    }

    else if(selector == '4'){
      for(auto item: cars){
        cout << "Placa: " << item.getPlate() << endl;
        cout << "Modelo: " << item.getModel() << endl;
        cout << "Cor: " << item.getColor() << endl;
        cout << "Cpf do Dono: " << item.getOwnerCpf() << endl;
      }
    }

    //Salvando no Banco de Pessoas
    ofstream user_db_out("users.txt", fstream::out);
    if(user_db_out.is_open()){
      for(auto item: users){
        user_db_out << item.getCpf() << endl;
        user_db_out << item.getName() << endl;
        user_db_out << item.getNumberOfCars() << endl;
      }
    }
    user_db_out.close();

    //Salvando no Banco de Carros
    ofstream cars_db_out("cars.txt", fstream::out);
    if(cars_db_out.is_open()){
      for(auto item: cars){
        cars_db_out << item.getOwnerCpf() << endl;
        cars_db_out << item.getPlate() << endl;
        cars_db_out << item.getModel() << endl;
        cars_db_out << item.getColor() << endl;
      }
    }
    cars_db_out.close();
  }

  cout << "Saiu\n";

  return 0;
}

void menu_inicial() {
  printf("\n-------------------------------------------------------------------------------------------\n");
  printf("---\t\t\tBANCO DE DADOS DE CARROS:\t\t\t\t\t---\n");
  printf("-------------------------------------------------------------------------------------------\n");
  printf("---\t\t\t(1) Consultar Carro\t\t\t\t\t---\n");
  printf("---\t\t\t(2) Consultar Usuário\t\t\t\t\t---\n");
  printf("---\t\t\t(3) Adicionar Usuário (Obrigatório Possuir Carro)\t\t\t\t\t---\n");
  printf("---\t\t\t(4) Adicionar Carro a Usuário\t\t\t\t\t---\n");
  printf("---\t\t\t(5) Excluir Carro\t\t\t\t\t---\n");
  printf("---\t\t\t(6) Excluir Usuário\t\t\t\t\t---\n");
  printf("---\t\t\t(7) Sair\t\t\t\t\t\t\t---\n");
  printf("-------------------------------------------------------------------------------------------\n");
}
