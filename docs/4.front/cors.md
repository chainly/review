# cors(Cross-Origin Resource Sharing, 跨域资源共享)

> https://developer.mozilla.org/en-US/docs/Glossary/CORS  
> https://fetch.spec.whatwg.org/#http-cors-protocol

## client side

> core is set `withCredentials: true` to `request`

### angular

    public post(url: string, body: any = null, success: Function=function(successful, data, res){}, error: Function=function(successful, msg, err){}): any {

        return this.request(url, new RequestOptions({
            method: RequestMethod.Post,
            body: body,
            // https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/withCredentials
            withCredentials: true,
            headers: new Headers({
                'Content-Type': 'application/json; charset=UTF-8',
            })
        }), success, error);
    }
    
### xml

> https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/withCredentials#Example

    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'http://example.com/', true);
    xhr.withCredentials = true;
    xhr.send(null);
    
    
## server side

> server side will recieve `OPTIONS` and `POST` request  
>> `OPTIONS` is required response with `Access-Control-Allow-Origin` ==> `request.Origin`,
>> `Access-Control-Allow-Headers` ==> `request.Access-Control-Request-Headers`,
>> `Access-Control-Allow-Credentials` == `"true"`
>>
>> `POST` is required response with "Access-Control-Allow-Origin" and "Access-Control-Allow-Credentials"

### django

> you also need to set `SESSION_COOKIE_SAMESITE = None` in django.settings
>> https://www.owasp.org/index.php/SameSite **but it may in danger, only for test**
>> maybe use `nginx to proxy angular and django` or token like:`OAuth2` or `simple user<->token`

# server-side

    def login(request):
        # https://fetch.spec.whatwg.org/#http-cors-protocol
        ACAO = request.headers.get("Origin", "") or \
            request.headers.get("Referer", "")
        if request.method == "OPTIONS":
            ACAH = request.headers.get("Access-Control-Request-Headers", "")
            r = HttpResponse()
            #r["Access-Control-Allow-Origin"] = ACAO
            r["Access-Control-Allow-Headers"] = ACAH
            #r["Access-Control-Allow-Credentials"] = "true"    
        else:
            #print(dir(request.GET), request.GET, request.POST, request.body)
            if not request.body:
                data = request.GET.dict()
            else:
                data = json.loads(request.body)

            user = None
            if data:
                username = data.get("username", None)
                password = data.get("password", None)
                user = authenticate(request, username=username, password=password)
            elif request.user.is_authenticated:
                user = request.user
            if user:
                _login(request, user)
                r = JsonResponse({"resultType": "success",
                                  "resultMsg": "Welcome: %s" % user.username})
            else:
                r = JsonResponse({"resultType": "error",
                                 "resultMsg": "error: %s" % 403})
        # No 'Access-Control-Allow-Origin' header is present on the requested resource.
        r["Access-Control-Allow-Origin"] = ACAO
        # The value of the 'Access-Control-Allow-Credentials' header in the response is '' which must be 'true' when the request's credentials mode is 'include'
        r["Access-Control-Allow-Credentials"] = "true"  
        return r
