# @jimmyyen/opencode-speak-human-tw

**說人話**：繁體中文的去 AI 味改寫 skill，打包成 [OpenCode](https://github.com/opencode-ai/opencode) plugin。

> 字都對，卻不像人講的話？那就是 AI 味。

## 安裝

在 `opencode.json` 的 `plugin` 陣列中加入：

```json
{
  "plugin": ["@jimmyyen/opencode-speak-human-tw"]
}
```

或手動安裝：

```bash
opencode install @jimmyyen/opencode-speak-human-tw
```

## 使用

安裝後，skill 會自動註冊。在對話中使用：

```
/speak-human-tw
```

或在提示中描述你想改寫的文本，skill 會自動觸發。

## 功能

- 6 條核心規則（動詞去被、名詞回人、台灣在地化…）
- 18 條句子級檢查
- 立場 × 開場 × 人味的排列組合框架
- 句首去 AI 味的專屬技巧
- 40 個 benchmark test case
- 台灣在地化詞彙替換建議

## 授權

MIT © [Raymond Hou (雷蒙三十)](https://github.com/Raymondhou0917)
