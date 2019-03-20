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
    void setNumberOfCars(unsigned int numberOfCars){
      this->number_of_cars = numberOfCars;
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
  //Flag que indica primeiro uso
  bool first_flag = false;

  //Seletor da opção
  char selector = '&';

  //Mostra Menu inicial
  menu_inicial();

  fstream user_db("users.txt", fstream::out | fstream::in | fstream::app);
  fstream car_db("cars.txt", fstream::out | fstream::in | fstream::app);

  //Verifica se o arquivo de usuários está vazio
  user_db.seekg(0, user_db.end);
  int lenght = user_db.tellg();

  //Fecha os arquivos
  user_db.close();
  car_db.close();

  //Seta flag para indicar primeiro uso
  if(lenght == 0){
    first_flag = true;
  }

  while(selector != '7'){

    //Sets a serem utilizados
    set<Pessoa> users;
    set<Car> cars;

    //Verifica se não é o primeiro uso para buscar os dados do arquivo
    if(!first_flag){
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

        cars_db_in >> plate;
        cars_db_in >> model;
        cars_db_in >> color;
        cars_db_in >> owner_cpf;

        //Impede que dados a mais sejam guardados no arquivo
        if(!cars_db_in.eof()){
          Car vehicle(plate, model, color, owner_cpf);
          cars.insert(vehicle);
        }

      }
      cars_db_in.close();

    }

    //Variáveis Auxiliadoras
    string aux_string;
    unsigned long long int aux_int;
    cin >> selector;

    if(selector == '1'){

      cout << endl << "(1) Consultar Carro" << endl;

      if(first_flag){
        cout << "Banco de Dados Vazio. Escolha uma opção de Inserção." << endl;
      }
      else{
        bool flag_found_car = false;
        cout << "Digite a placa do Carro: ";
        cin >> aux_string;
        for(auto item: cars){
          if(item.getPlate() == aux_string){
            cout << "Carro Encontrado!" << endl;
            cout << "Placa: " << item.getPlate() << endl;
            cout << "Modelo: " << item.getModel() << endl;
            cout << "Cor: " << item.getColor() << endl;
            cout << "Cpf do Dono: " << item.getOwnerCpf() << endl;
            flag_found_car = true;
          }
        }
        if(flag_found_car == false){
          cout << "Carro Não Encontrado." << endl;
        }
      }
    } // Correto //Pronto //Funcionando

    else if(selector == '2'){

      cout << endl << "(2) Consultar Usuário" << endl;


      if(first_flag){
        cout << "Banco de Dados Vazio. Escolha uma opção de Inserção." << endl;
      }
      else{
        cout << "Digite o CPF do Usuário: ";
        cin >> aux_int;
        bool flag_found_user = false;

        for(auto item: users){
          if(item.getCpf() == aux_int){

            flag_found_user = true;
            cout << "Nome do usuário: " << item.getName() << endl;
            cout << "CPF do usuário: " << item.getCpf() << endl;
            cout << "Número de carros do usuário: " << item.getNumberOfCars() << endl;

            int cont = 1;

            for(auto item_car: cars){
              if(item_car.getOwnerCpf() == item.getCpf()){
                cout << "Placa do Carro " << cont << ": " << item_car.getPlate() << endl;
                cont++;
              }
            }

          }
        }
        if(flag_found_user == false){
          cout << "Usuário Não Encontrado." << endl;
        }
      }
    } //Correto //Pronto //Funcionando

    else if(selector == '3'){

      cout << endl << "(3) Adicionar Usuário (Obrigatório Possuir Carro)" << endl;

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

      flag = false;
      while(!flag){
        cout << "Digite o Número de Carros do Usuário: ";
        cin >> aux_number_of_cars;
        flag = true;
        if(aux_number_of_cars <= 0){
          flag = false;
          cout << "Número de Carros Inválido. Insira Pelo Menos Um Carro" << endl;
        }
      }


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

      if(first_flag){
        first_flag = false;
      }

      cout << "Usuário Cadastrado Com Sucesso!" << endl;

    }  //Correto //Pronto //Funcionando

    else if(selector == '4'){

      cout << endl << "(4) Adicionar Carro a Usuário" << endl;

      if(first_flag){
        cout << "Banco de Dados Vazio. Escolha uma opção de Inserção." << endl;
      }
      else{
        string name;
        unsigned long long int cpf;
        unsigned int number_of_cars;

        cout << "Digite o CPF do Usuário a adicionar: ";
        cin >> aux_int;
        bool flag_found_user = false;

        for(auto item: users){
          if(item.getCpf() == aux_int){

            flag_found_user = true;

            cout << "Nome do usuário: " << item.getName() << endl;
            cout << "CPF do usuário: " << item.getCpf() << endl;
            cout << "Número de carros do usuário: " << item.getNumberOfCars() << endl;

            string plate;
            string model;
            string color;

            cout << "Insira Dados do Carro:" << endl;

            bool flag_plate = false;
            while(!flag_plate){
              cout << "Placa: ";
              cin >> plate;
              flag_plate = true;
              for(auto item_car: cars){
                if(item_car.getPlate() == plate){
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
            cout << "Carro Adicionado com Sucesso!" << endl;

            name = item.getName();
            cpf = item.getCpf();
            number_of_cars = item.getNumberOfCars();

          }
        }

        if(flag_found_user == false){
          cout << "Usuário Não Encontrado." << endl;
        }
        else{
          users.erase(Pessoa(name, cpf, number_of_cars));
          number_of_cars = number_of_cars + 1;
          users.insert(Pessoa(name, cpf, number_of_cars));
        }
      }
    }

    else if(selector == '5'){
      cout << endl << "(5) Excluir Carro" << endl;

      if(first_flag){
        cout << "Banco de Dados Vazio. Escolha uma opção de Inserção." << endl;
      }
      else{
        bool flag_found_car = false;
        //Dados do carro a ser deletado
        string plate;
        string model;
        string color;
        unsigned long long int owner_cpf_here;
        //Dados do Usuário a ser modificado
        string name;
        unsigned long long int cpf;
        unsigned int number_of_cars;

        //Caso em que o usuário ficará sem carros
        bool need_to_delete_user = false;

        cout << "Digite a placa do Carro a Ser Excluído: ";
        cin >> aux_string;


        for(auto item: cars){
          if(item.getPlate() == aux_string){
            cout << "Carro Encontrado!" << endl;
            plate = item.getPlate();
            model = item.getModel();
            color = item.getColor();
            owner_cpf_here = item.getOwnerCpf();

            for(auto item_person: users){
              if(item_person.getCpf() == item.getOwnerCpf()){

                name = item_person.getName();
                cpf = item_person.getCpf();
                number_of_cars = item_person.getNumberOfCars();

                flag_found_car = true;

                if(item_person.getNumberOfCars() == 1){
                  need_to_delete_user = true;
                  cout << "Único carro do usuário. Usuário será excluído." << endl;
                }
              }
            }
          }
        }


        if(flag_found_car == false){
          cout << "Carro Não Encontrado." << endl;
        }
        else{
          cars.erase(Car(plate, model, color, owner_cpf_here));
          cout << "Carro Deletado do Sistema" << endl;

          //Caso o usuário seja deletado
          if(need_to_delete_user){
            users.erase(Pessoa(name, cpf, number_of_cars));
            cout << "Usuário Deletado do Sistema:" << endl;
            cout << "CPF: " << cpf << endl;
            cout << "Nome: " << name << endl;
          }
          else{
            users.erase(Pessoa(name, cpf, number_of_cars));
            number_of_cars = number_of_cars - 1;
            users.insert(Pessoa(name, cpf, number_of_cars));
            cout << "Usuário Modificado:" << endl;
            cout << "CPF: " << cpf << endl;
            cout << "Nome: " << name << endl;
          }
        }
      }
    }

    else if(selector == '6'){

      cout << endl << "(6) Excluir Usuário e Carros Pertencentes" << endl;

      if(first_flag){
        cout << "Banco de Dados Vazio. Escolha uma opção de Inserção." << endl;
      }
      else{
        string name;
        unsigned long long int cpf;
        unsigned int number_of_cars;
        unsigned int quantity_of_cars;

        cout << "Digite o CPF do Usuário: ";
        cin >> aux_int;
        bool flag_found_user = false;

        for(auto item: users){
          if(item.getCpf() == aux_int){

            flag_found_user = true;
            cout << "Usuário Encontrado" << endl;
            quantity_of_cars = item.getNumberOfCars();
            name = item.getName();
            cpf = item.getCpf();
            number_of_cars = item.getNumberOfCars();

          }
        }

        if(flag_found_user == false){
          cout << "Usuário Não Encontrado." << endl;
        }
        else{
          //Deleta o Usuário e Seus Carros
          users.erase(Pessoa(name, cpf, number_of_cars));
          cout << "Usuário Deletado" << endl;

          while(quantity_of_cars > 0){
            string plate;
            string model;
            string color;
            unsigned long long int owner_cpf_here;

            for(auto item_car: cars){
              if(item_car.getOwnerCpf() == aux_int){
                cout << "Carro Deletado: " << item_car.getPlate() << endl;
                plate = item_car.getPlate();
                model = item_car.getModel();
                color = item_car.getColor();
                owner_cpf_here = item_car.getOwnerCpf();
                break;
              }
            }
            cars.erase(Car(plate, model, color, owner_cpf_here));
            quantity_of_cars--;
          }
        }
      }

    } //Funcionando

    //Verifica se não é o primeiro uso para salvar os dados
    if(!first_flag){
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
          cars_db_out << item.getPlate() << endl;
          cars_db_out << item.getModel() << endl;
          cars_db_out << item.getColor() << endl;
          cars_db_out << item.getOwnerCpf() << endl;
        }
      }
      cars_db_out.close();
    }

  }

  cout << endl << "(7) Sair" << endl;

  return 0;
}

void menu_inicial() {
  printf("\n-----------------------------------------------------\n");
  printf("---\tBANCO DE DADOS DE CARROS: -------------------\n");
  printf("-----------------------------------------------------\n");
  printf("---\t(1) Consultar Carro\n");
  printf("---\t(2) Consultar Usuário\n");
  printf("---\t(3) Adicionar Usuário (Obrigatório Possuir Carro)\n");
  printf("---\t(4) Adicionar Carro a Usuário\n");
  printf("---\t(5) Excluir Carro\n");
  printf("---\t(6) Excluir Usuário e Carros Pertencentes\n");
  printf("---\t(7) Sair\n");
  printf("-----------------------------------------------------\n");
}
