#include <ctime>
#include <cstdlib>
#include <iostream>
using namespace std;
int main() {
    srand((unsigned int) time(NULL));
    int random_num = rand()%100;
    int player_res;
    bool result = false;
    cout<<"Welcome To Random Number Guessing Game"<<endl;
    cout<<"**************************************"<<endl;
    
    cout<<"choose a Number Between 1 to 100"<<endl;
    do{
        cin>>player_res;
        if(player_res==random_num){
            cout<<"Yokoso Watashi no Soul Society"<<endl;
            result = true;
        }
        else if(player_res > random_num){
            cout<<"Please choose a smaller Number."<<endl;
        }
        else if (player_res < random_num){
            cout<<"Please Choose a Greater Number."<<endl;
        }
    }while(result != true);
    cout<<"*************************************"<<endl;
    cout<<"Hado no kyu jyu kyu goryu Tenmetsu."<<endl;
    return 0;
}