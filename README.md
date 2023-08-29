# novel_reader

  小说阅读app,打开本地文件阅读,支持txt格式  
  写这个demo目的是为了实践长列表的优化,以及sliver的监听

## 主要功能
  1. `章节分析器`: 打开txt文件,通过[xxx卷? 卷名? xxx章 章名]形式分析出章节,然后记录(章节信息,章数,章名,卷数?,卷名?,章节开始位置),并缓存到本地  
  2. `书架`: 读取缓存的章节信息,显示到书架上,点击书架上的书,打开阅读界面  
  3. `阅读界面`: 使用sliver实现,通过两个滚动视图实现上下章节加载  

## 插件
  1. `path_provider`,`file_picker`: 读写文件
  2. `mmkv`, `shared_preferences`: 本地缓存
  3. `get_it`,`riverpod`: 状态管理
  4. `scrollview_observer`,`keframe`,`lifecycle`: 阅读界面
  5. `auto_route`: 路由管理
  

