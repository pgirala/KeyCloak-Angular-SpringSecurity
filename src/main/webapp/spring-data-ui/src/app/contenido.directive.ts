import { Directive, ElementRef, Input, OnInit, SimpleChanges, OnChanges, Injector } from '@angular/core';
import { inject } from '@angular/core/testing';

export const ScopeProvider = {
  deps: ['$injector'],
  provide: '$scope',
  useFactory: (injector: Injector) => injector.get('$rootScope').$new(),
};

@Directive({
  providers: [ ScopeProvider ],
  selector: '[appContenido]'
})

export class ContenidoDirective implements OnInit, OnChanges  {

  @Input('appContenido') contenido: string;

  constructor(private elemento: ElementRef, inj: Injector) { }

  ngOnInit(): void {
    this.actualizar();
  }

  ngOnChanges(changes: SimpleChanges) {
    this.actualizar();
  }

  actualizar() {

  }
}
