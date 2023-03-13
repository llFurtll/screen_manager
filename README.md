# ScreenManager

<a href="https://www.buymeacoffee.com/danielmelonari" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

## Por que?
Sempre que falamos em injeções de dependências, separação de regra da UI, vamos diretamente em plugins que nos facilitam isso, porém sempre fiquei com pé atrás em ficar utilizando plugins terceiros que nos ajudam a realizar tais tarefas, onde com o próprio Flutter tem recursos para realizarmos tais tarefas. Então pensei em criar um plugin utilizando os recursos do Flutter para ajudar a realizar as injeções e separações de forma simples.

## Observações
Antes de utilizar esse plugin, saiba que ele está em fase inicial, isso significa que não possuí muitos recursos, basicamente o que desenvolvi nele nada mais é que um padrão para seu projeto, e o que ele vem para ajudar basicamente foi feito conforme eu necessitava em meus projetos iniciais, então dependendo do que você esteja procurando, pode ser que ainda o ScreenManager não tenha essa funcionalidade, mas nada impede desse plugin futuramente crescer ainda mais para ser utilizados para várias situações do dia a dia do desenvolvedor.

## Pontos a entender
O ScreenManager possúi uma estrutura criado por mim mesmo no momento de criar suas UI do aplicativo, vamos entender essa estrutura, lembrando que você não precisa seguir essa estrutura de certa forma, fica a seu critério o melhor jeito, vamos lá.
```
 - lib
   - home
     - controller
     - injection
     - view
     - widgets || components
```
* <b>controller: </b> Aqui ficará o controlador da sua view, suas regras de negócio, atualização de estado entre outros.
* <b>injection: </b> Aqui ficará suas dependências que você deseja que sua tela tenha acesso como, data sources, repository, use case entre outros.
* <b>view: </b> Aqui ficará sua view, onde você cria a ponte entre as injeções e sua tela, também ficará a junção de seus widgets/components.
* <b>widgets || components: </b> Caso você tenha o mesmo gosto que eu, quando tem uma AppBar, FloatAction em minha View, costumo separar esses widgets ou components em arquivos separados, deixando as coisas mais desacopladas, aqui ficará todos essas partes da sua UI.

## Controller
Agora vamos entender a Controller, antes que você pergunte, sim algumas coisas eu fiz baseado no plugin GetX, para criar uma controller é muito simples, basta seguir o código abaixo:
```dart
 class HomeController extends ScreenController {}
```
Apenas isso que você precisa para criar sua Controller, ela também possuí alguns métodos que são possíveis realizar sobrecarga, segue exemplo:
```dart
 class HomeController extends ScreenController {
   @override
   void onInit() {
    super.onInit();
   }
   
   @override
   void onReady() {
    super.onReady();
   }
   
   @override
   void onClose() {
    super.onClose();
   }
   
   @override
   void onDependencies() {
    super.onDependencies();
   }
 }
```
* <b>onInit: </b> Esse método é executado no initState do StatefulWidget.
* <b>onReady: </b> Esse método é executado após o build do StatefulWidget.
* <b>onClose: </b> Esse método é executado no dispose do StatefulWidget.
* <b>onDependencies: </b> Esse método é executado no didChangeDependencies do StatefulWidget.
* <b>refresh: </b> Esse método chama o setState do seu StatefulWidget.

## Injection
O Injection é a parte que você cria as instâncias de objetos que você deseja acessar posteriormente em sua UI, segue exemplo de criação:
```dart
 class HomeInjection extends ScreenInjection<HomeController> {
  HomeInjection({
   Key? key,
   required ScreenBridge child
  }) : super(
    key: key,
    child: child,
    controller: HomeController()
  );
 }
```
Como pode notar, na Injection também colocamos qual é o controller responsável, para que a classe ScreenBridge, que no caso é a nossa ponte entre as injeções e a UI possa fazer seu trabalho de realizar as injeções da controller na UI.
Na injection também é possível no super do construtor definir mais um argumento que se chama `receiveArgs`, segue um exemplo, esse será explicado posteriormente.
```dart
 receiveArgs: const ScreenReceiveArgs(receive: true, identity: "homeview")
```

## View
Nesse momento será a hora de criar sua View, aqui conterá a classe ScreenBridge, sua Injection e sua View, segue exemplo:
```dart
  class HomeBridge extends Screen {
    const HomeBridge({Key? key}) : super(key: key);
    
    @override
    HomeInjection build(BuildContext context) {
      return HomeInjection(
        child: const ScreenBridge<HomeController, HomeInjection>(
          child: HomeView(),
        )
      );
    }
  }
  
  class HomeView extends ScreenView<HomeController> {
    const HomeView({Key? key}) : super(key: key);
    
    @override
    Scaffold build(BuildContext context) {
      return const Scaffold();
    }
  }
```
Como você pode ver, na parte da Bridge você primeiramente retorna sua Injection, nisso você retorna o ScreenBridge onde é a ponte, indicando para a mesma qual é a controller e a injection que ele deverá utilizar para realizar as injeções e criações necessárias, nisso o filho da ponte será de fato sua view, essa ponte é extremamente necessária estar configurada corretamente, pois se não a criação da view não será possível ser feito, e erros podem acontecer.

Na parte da View apenas é necessário fazer a sobrecarga do método build e retornar um Scaffold, toda View será necessário ter um Scaffold para ser possível realizar as operações como BottomSheet entre outros widgets que necessita de um Scaffold.

Um ponto importante, toda View nesse caso é um StatefulWidget.

## Widgets
Caso você queira criar Widgets para sua tela, onde eles também teram acesso ao controller da UI, lembrando que esses widgets são feitos exclusivamente para a UI, por motivos que ele compartilha o mesmo controller.
```dart
 class FabWidget extends ScreenWidget<HomeController> {
   @override
   void onInit() {
    super.onInit();
    
    print("INIT");
   }
   
   @override
   void onReady() {
    print("READY");
   }
 
   @override
   Widget build(BuildContext context) {
     super.build(context);
     
     return FloatActionButton(
       onPressed: controller.add,
       child: const Icon(Icons.add)
     );
   }
 }
```
Também possuí alguns métodos de sobrecarga:
* <b>onInit: </b> Esse método é executado antes de retornar o Widget em si.
* <b>onReady: </b> Após o build do Widget o mesmo é chamado.

Um ponto importante, todo Widget que extends ScreenWidget é um StatelesWidget.

## Disparando mensagens entre Views (ScreenReceiveArgs)
Lembra daquele argumento que eu falei que você poderia adicionar a mais no super do Injection? Aí está o ponto, aquele argumento serve para identificar se sua View estará visível para receber chamadas, segue novamente um exemplo mostrando.
Então primeiramente em sua Injection:
```dart
class HomeInjection extends ScreenInjection<HomeController> {
  HomeInjection({
    Key? key,
    required ScreenBridge child
  }) : super(
    key: key,
    child: child,
    controller: HomeController(),
    receiveArgs: const ScreenReceiveArgs(receive: true, identity: "homeview")
  );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
```
Como você pode ver, na Injection da Home, definimos que ela receberá chamadas, passando como true no argumento receive e a identificação que será utilizada para chamar essa View.
Após isso em nossa controller implementaremos um método chamado `receive`, ou um nome que você achar melhor, segue exemplo:
```dart
void receive(String message, dynamic value, {ScreenReceive? screen}) {
  switch (message) {
    case "new_people":
      peoples.add(value);
      break;
    case "update_people":
      int position = peoples.indexWhere((people) => people.id == value.id);
      peoples[position] = value;
  }

  refresh();
}
```
e na sua View, irá fazer uma sobrecarga no método `receive`:
```dart
@override
void receive(String message, value, {ScreenReceive? screen}) {
  controller.receive(message, value);
}
```
O método `receive` tem 3 parâmetros:
<b> message: </b> Qual a mensagem da chamada, no nosso exemplo tem a mensagem 'new_people', 'update_people', nesse caso baseado na mensagem você irá disparar funções diferentes.
<b> value: </b> No caso se você deseja enviar um valor para View, você irá passar nessa informação, no nosso exemplo estou passando uma entidade do tipo People.
<b> screen: </b> No caso, se você desejar passar a instância da View que está realizando a chamada, e criar uma lógica do tipo, caso essa tela esteja em atualização, nenhuma chamada da View x será aceito, você também pode utilizar dessa forma.

Para realizar a chamada é bem simples, você usará a classe ScreenMediator para isso, segue exemplo:
```dart
ScreenMediator.callScreen("homeview", "new_people", people);
```
Lembrando que, para realizar essa chamada, na Injection novamente, deve-se estar configurado para a View receber essas chamadas, cuidado também com a identificação, se a mesma estiver errada, um erro será disparado.


Caso queira ver alguns exemplos, nesse repositório contém o exemplo que criei utilizando os padrões do plugin, também em meu repositório existe o projeto <a href="https://github.com/llFurtll/easy_note" target="blank">EasyNote</a>, onde eu fiz esse projeto utilizando os padrões desse plugin.

### :man:  Dev
<a href="https://www.linkedin.com/in/daniel-melonari-5413a7197/" target="_blank">
 <img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/48370450?v=4" width="100px;" height="100px" alt=""/>
 <br />
 <sub><b>Daniel Melonari</b></sub></a> <a href="https://www.linkedin.com/in/daniel-melonari-5413a7197/" title="Linkedin" target="_blank">🚀</a>


Done with ❤️ by Daniel Melonari 👋🏽 Contact!

[![Linkedin Badge](https://img.shields.io/badge/-Daniel-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/daniel-melonari-5413a7197/)](https://www.linkedin.com/in/daniel-melonari-5413a7197/) 
[![Gmail Badge](https://img.shields.io/badge/-danielmelonari@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:danielmelonari@gmail.com)](mailto:danielmelonari@gmail.com)
