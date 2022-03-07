import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [  ]

  connect() {
    // event listener
    // pegamos todos os inputs e pra cada
    document.querySelectorAll('input').forEach(($input) => {
      //se estiver definido o tipo de mask
      if ($input.dataset.mask !== undefined) {
        // se não estiver definido, vamos checar se ele tem um data action
        if ($input.dataset.action === undefined) {
          // se não tiver o data action, vamos colocar
          $input.setAttribute('data-action', 'input->masks#inputmask');
        } else {
          // se ele já tiver, vamos adicionar
          $input.dataset.action += " input->masks#inputmask"
        }
        // esse mask vai ser o masks que setamos lá embaixo
        console.log(this.masks($input.dataset.mask, $input.value))
        $input.value = this.masks($input.dataset.mask, $input.value);
      }
    })
  }
  // callback de " input->mask#inputmask", do que colocomamos no html pra chamar stimulus
  inputmask = (event) => {
    // criando uma variavel que pega o currentTarget
    const input = event.currentTarget;
    // type é o data mask passado no input do form, é o tipo de mascara a ser aplicado
    const type = input.dataset.mask;
    if (type !== undefined) {
      // devolve pro form o valor formatado
      input.value = this.masks(type, input.value);
    }
  }

  masks = (type, value) => {
    switch (type) {
      case 'currency':
        return value
          .replace(/\D/g, "")
          .replace(/^0+$/, "0,00")
          .replace(/^[0\,]*(\d)$/, "0,0$1")
          .replace(/^0*(\d{2})$/, "0,$1")
          .replace(/^0*(\d+)(\d{2})$/, "$1,$2")
          .replace(/(\d)(\d{3})(,\d{2})$/, "$1.$2$3")
          .replace(/(\d)(\d{3})(\.)/, "$1.$2$3")
          .replace(/(\d)(\d{3}\.)/g, "$1.$2")
          .replace(/(\d{3})(\d)\.(\d{2})(\d)\.(\d{2})(\d)\.(\d{2})(\d)\,(\d)\d/, "$1.$2$3.$4$5.$6$7,$8$9")
        break;
}
  }
}
