# 基本类型
numbers
strings
lists
tuples
sets
dicts

# flow ctr
if/else/elif
for
while
break/continue/pass

# buildin func
```
import builtins
dir(builtins)
```
range
sorted
reversed
filter

# package and modules
`__init__.py`: `__all__`

## 绝对导入
> When importing the package, Python searches through the directories on sys.path looking for the package subdirectory

## 相对导入
> Since the name of the main module is always "__main__", modules intended for use as the main module of a Python application must always use absolute imports.

# IO
input
print
string.format
open

# Exceptions
```
try:
    code
    raise
except (xx, xxx):
    code
else:
    code
finally:
    code

# With Statement Context Managers
class A():
   r = []
   def __enter__(self):
        return self.r
   def __exit__(self, exc_type, exc_value, traceback):
        if exc_type:
            code
        self.r = []
```

# 面向对象
## namespace
- the innermost local scope
- the nearest enclosing scope
- the scopes of any enclosing functions
- global
- built-in

### nolocal
> nolocal 相当于仅作用于闭包内的global; 无-->重新赋值则会重新定义==local xx.

- The global statement can be used to indicate that particular variables live in the global scope and should be rebound there; 
- the nonlocal statement indicates that particular variables live in an enclosing scope and should be rebound there.

## 抽象, 封装
pass
## 继承
### mro(Method Resolution Order方法解析顺序)
> http://python.jobbole.com/85685/

- 经典类(<=2.1): 深度遍历; Q:菱形继承,导致后面的可能没法继承
- 新式类(2.2 均继承与object): 广度遍历; Q:
- C3: 基于深度优先的拓扑排序(检查0入度)

## 多态
overwrite
pass

## 重载
无; `usage(xx, yy=aa, *args, **kwarg)`

## 设计原则
> https://blog.csdn.net/qazwyc/article/details/78005613

## 
```
type
class = type('class.name', bases(->super), dict(->k: v))
instance = class(*args, **kwargs)
```
