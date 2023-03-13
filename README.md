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

## Calling the component on the screen.

## Conversable class

### :man:  Dev
<a href="https://www.linkedin.com/in/daniel-melonari-5413a7197/" target="_blank">
 <img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/48370450?v=4" width="100px;" height="100px" alt=""/>
 <br />
 <sub><b>Daniel Melonari</b></sub></a> <a href="https://www.linkedin.com/in/daniel-melonari-5413a7197/" title="Linkedin" target="_blank">🚀</a>


Done with ❤️ by Daniel Melonari 👋🏽 Contact!

[![Linkedin Badge](https://img.shields.io/badge/-Daniel-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/daniel-melonari-5413a7197/)](https://www.linkedin.com/in/daniel-melonari-5413a7197/) 
[![Gmail Badge](https://img.shields.io/badge/-danielmelonari@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:danielmelonari@gmail.com)](mailto:danielmelonari@gmail.com)
