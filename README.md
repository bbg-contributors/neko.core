# neko.core
对目前 index.html 的 Vue 重构

## 推荐 IDE 配置

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar)（需禁用 Vetur）

## 在 TS 中支持 .vue 导入的类型提示

TypeScript 默认无法处理 .vue 导入的类型信息，因此我们使用 `vue-tsc` 替代 `tsc` 进行类型检查。在编辑器中，需要安装 [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) 插件来为 TypeScript 语言服务提供 .vue 文件类型支持。

## 自定义配置

参考 [Vite 配置文档](https://vite.dev/config/)

## 项目初始化

```sh
pnpm install
```

### 开发环境热重载编译

```sh
pnpm dev
```

### 生产环境类型检查与构建

```sh
pnpm build
```