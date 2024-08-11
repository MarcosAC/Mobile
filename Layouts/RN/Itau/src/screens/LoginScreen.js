import {Text, View, Button, SafeAreaView, StyleSheet, TouchableOpacity} from 'react-native';
import React, {Component} from 'react';

export default class LoginScreen extends Component {
  render() {
    return (
      <SafeAreaView style = {styles.container}>
        <View style={{flex: 1, justifyContent: 'flex-end'}}>
          <View style= {{flex: 2, /*backgroundColor: 'white',*/ marginTop: 80}}>
            <Text>Logo Itaú</Text>
          </View>
          <View style={{flex: 1, justifyContent: 'space-around'/*, backgroundColor: 'blue'*/}}>
            <View /*style={{backgroundColor: 'green'}}*/>
              <Text>Um Itaú de vantagens, mais simples e seguro pra você</Text>
              <Text>não sou cliente</Text>
            </View>
          
            <View /*style={{backgroundColor: 'blue'}}*/>
              <Button title="acessar" onPress={() => {}} />
              <TouchableOpacity style={{alignItems: 'center'}}>
                <Text>Não sou cliente</Text>
              </TouchableOpacity>
              <View style={{flexDirection: 'row', justifyContent:'space-around'}}>
                <TouchableOpacity>
                  <Text>iToken</Text>
                </TouchableOpacity>
                <TouchableOpacity>
                  <Text>Ajuda</Text>
                </TouchableOpacity>
              </View>
              
            </View>            
          </View>          
        </View>
        
      </SafeAreaView>
    );
  }
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    //backgroundColor: 'red',
  },
});