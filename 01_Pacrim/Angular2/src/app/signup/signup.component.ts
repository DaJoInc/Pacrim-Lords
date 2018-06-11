import { Inject } from '@angular/core';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { DisplayMessage } from '../shared/models/display-message';
import { Subscription } from 'rxjs/Subscription';
import {BehaviorSubject} from 'rxjs/BehaviorSubject';
import {INgxSelectOption} from '../lib/ngx-select/ngx-select.interfaces';
import {
  UserService,
  AuthService, 
} from '../service';

import { Observable } from 'rxjs/Observable';
import { Subject } from 'rxjs/Subject';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss']
})
export class SignupComponent implements OnInit, OnDestroy {
  title = 'Sign up';
  githubLink = 'https://github.com/DaJoInc/Pacrim-Lords';
  form: FormGroup;

  /**
   * Boolean used in telling the UI
   * that the form has been submitted
   * and is awaiting a response
   */
  submitted = false;

  /**
   * Notification message from received
   * form request or router
   */
  notification: DisplayMessage;

  returnUrl: string;
  private ngUnsubscribe: Subject<void> = new Subject<void>();

  constructor(
    private userService: UserService,
    private authService: AuthService,
    private router: Router,
    private route: ActivatedRoute,
    private formBuilder: FormBuilder
  ) {
        
      
    }

  ngOnInit() {
    this.authService.allCountry()
    // show me the animation
    .delay(0)
    .subscribe(data => {
      if(data.procesoRespuestaApiRest.codigoRespuestaApi='OK'){
          
        data.countryDtos.forEach((pais:{paisCodigo:string, paisNombre:string}) => {
          this.itemsCountry.push({
            id: pais.paisCodigo,
            text: `${pais.paisNombre}`
          });
      
      
        });
      }
    },
    error => {
      this.submitted = false;
      console.log("Sign up error" + JSON.stringify(error));
      this.notification = { msgType: 'error', msgBody: error['error'].errorMessage };
    });
     
    this.route.params
    .takeUntil(this.ngUnsubscribe)
    .subscribe((params: DisplayMessage) => {
      this.notification = params;
    });
    // get return url from route parameters or default to '/'
    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
    this.form = this.formBuilder.group({
      username: ['', Validators.compose([Validators.required, Validators.minLength(3), Validators.maxLength(64)])],
      password: ['', Validators.compose([Validators.required, Validators.minLength(3), Validators.maxLength(32)])],
      firstname:[''],
      lastname: ['']
    });

    
     
  }

  ngOnDestroy() {
    this.ngUnsubscribe.next();
    this.ngUnsubscribe.complete();
  }

  repository() {
    window.location.href = this.githubLink;
  }

  onSubmit() {
    /**
     * Innocent until proven guilty
     */
    this.notification = undefined;
    this.submitted = true;

    this.authService.signup(this.form.value)
    // show me the animation
    .delay(1000)
    .subscribe(data => {
      console.log(data);
      this.authService.login(this.form.value).subscribe(data =>{
        this.userService.getMyInfo().subscribe();
      })
      this.router.navigate([this.returnUrl]);
    },
    error => {
      this.submitted = false;
      console.log("Sign up error" + JSON.stringify(error));
      this.notification = { msgType: 'error', msgBody: error['error'].errorMessage };
    });

  }
  selectedCarId = 3;
  private itemsCountry:Array<any> = [];
  private itemsState:Array<any> = [];
  private itemsCities:Array<any> = [];
  private value:any = {};
  private _valueCountry:Array <any> = [];
  private _valueState:Array <any> = [];
  private _valueCities:Array <any> = [];
  private _disabledV:string = '0';
  private disabled:boolean = false;
 
  private get disabledV():string {
    return this._disabledV;
  }
 
  private set disabledV(value:string) {
    this._disabledV = value;
    this.disabled = this._disabledV === '1';
  }
 
  public selected(value:any):void {
      let stateValue = {codigoPais:""};
      stateValue.codigoPais = value;
    console.log('Selected value is: ', stateValue);
    this.authService.allState(stateValue)
    // show me the animation
    .delay(0)
    .subscribe(data => {
      if(data.procesoRespuestaApiRest.codigoRespuestaApi='OK'){
          
        data.departamentoPais.forEach((departamento:{departamentoCodigo:string, departamentoNombre:string}) => {
          this.itemsState.push({
            id: departamento.departamentoCodigo,
            text: `${departamento.departamentoNombre}`
          });
      
      
        });
      }
    },
    error => {
      this.submitted = false;
      console.log("Sign up error" + JSON.stringify(error));
      this.notification = { msgType: 'error', msgBody: error['error'].errorMessage };
    });
  }
   public selectedState(value:any):void {
      let citiesValue = {codigoPais:"",codigoDeparta:""};
      let valueOwn = this._valueCountry;
       console.log('Citie is: ', valueOwn);
      citiesValue.codigoPais = valueOwn['text'];
      citiesValue.codigoDeparta = value;
    console.log('Selected value is: ', citiesValue);
    this.authService.allCitie(citiesValue)
    // show me the animation
    .delay(0)
    .subscribe(data => {

        if(data.procesoRespuestaApiRest.codigoRespuestaApi='OK'){
          
        data.ciudadesPais.forEach((ciudad:{ciudadLatitud:string, ciudadLongitud:string, ciudadNombre:string}) => {
          this.itemsCities.push({
            id: ciudad.ciudadNombre,
            text: `${ciudad.ciudadNombre} (${ciudad.ciudadLatitud} ${ciudad.ciudadLongitud})`
          });
      
      
        });
      }
    },
    error => {
      this.submitted = false;
      console.log("Sign up error" + JSON.stringify(error));
      this.notification = { msgType: 'error', msgBody: error['error'].errorMessage };
    });
  }
   public selectedCities(value:any):void {
      let stateValue = {codigoPais:""};
      stateValue.codigoPais = value;
    console.log('Selected value is: ', stateValue);
  }
  public removed(value:any):void {
    console.log('Removed value is: ', value);
  }
 
  public typed(value:any):void {
    console.log('New search input: ', value);
  }
 
  public refreshValue(value:any):void {
    this.value = value;
  }
  
    public ngxValueCountry: any[] = [];
    public ngxValueState: any[] = [];
    public ngxValueCities: any[] = [];
    public ngxDisabled = false;


    public doSelectOptionsCountry(options: INgxSelectOption[]):void{
     this.itemsState = [];
     this._valueCountry = options[0].data;
     console.log('SingleDemoComponent.doSelectOptions', this._valueCountry);
     this.selected(options[0].data.text);
    }
    
    public doSelectOptionsState(options: INgxSelectOption[]):void{
     this.itemsCities = [];
     console.log('SingleDemoComponent.doSelectOptions', options[0].data.text);
     this.selectedState(options[0].data.text);
    }
    
    public doSelectOptionsCities(options: INgxSelectOption[]):void{
     console.log('SingleDemoComponent.doSelectOptions', options[0].data.text);
     this.selectedCities(options[0].data.text);
    }
}
