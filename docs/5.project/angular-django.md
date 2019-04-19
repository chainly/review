# reading result
## base idea
```
front:

          --> root.routing.ts 
         |              |                   --> other service/component
        |              |                                                ^
       |              |                                                 |---- other service
      |              |                                                                ^
     |              v                                                                |
root->  login -> main-component -->  a core component --> detail/others component
            ^                                     |
            |                                     |-- a service
           |                                               |
   set-cookie/xxx                            check by cookie == session
         |                                               |
        |                                               |
backend: django/restful/GraphQL <-------|

```

## base structure
```
/project
    /src
        /app
            /c1
                /c1-core
                /c1-detail
                /c1-model
                /c1-service
                
        /environments
            environment.prod.ts
            environment.dev.ts
        index.html `<app-root></app-root>`
        main.ts ``platformBrowserDynamic().bootstrapModule(AppModule);
        styles.css


```
## ng new project/ng generate component 
1. app.module.ts
> `@NgModule({k: v})`  # @: to decorator following class

imports: module you want to use
declarations:  Component render to  html marker you use
provider: Service to provide/inject data to Component
bootstrap: root Component

> export class AppModule { }: you can import by the other module?

2. app.component.ts
> `@Component({k: v})`

selector: html marker to render
templateUrl: html
styleUrls: css

> `export class AppComponent {}`

3. app.component.html
> `<router-outlet></router-outlet>`: for `app-routing.compoment.ts`==>path==>Componment
    > or by `<a routerLink="/heroes">Heroes</a>`==>path==>Componment
> html...

4. app.component.css
5. app.ts
> define model <--> backend/js-object

## ng generate service
1. app.service.ts/app.messages.ts
> `@Injectable({k: v})`

providedIn: root->project; @NgModule; other Injector

## ng generate module app-routing --flat --module=app
1. app-routing.module.ts
> `Routes = [{k: v}]`

path: uri
compoent: Component

redirectTo: path

pathMatch: how to match path


> `@NgModule({k: v})`


imports: `[ RouterModule.forRoot(routes) ]`
其他同上



> `export class AppRoutingModule {}`


## http
pass






constructor(
    private route: ActivatedRoute,
    private heroService: HeroService,
    private location: Location
) {}

request: +this.route.snapshot.paramMap.get('id'); # + ==> int ???
location: this.location.back(); # windows.location
