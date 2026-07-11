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

安裝後，skill 會自動註冊。在對話中描述你想做的事，skill 就會觸發：

- 「這段去 AI 味」
- 「幫我潤稿」
- 「這段好 AI，改自然一點」
- 「校對一下再發」

關鍵詞觸發，不需要特定指令格式。

Plugin 也會自動註冊 `/speak-human-tw` slash command，直接在對話中輸入 `/speak-human-tw` 加上你的文字就能使用。

## 功能

- 6 條核心規則（動詞去被、名詞回人、台灣在地化…）
- 18 條句子級檢查
- 立場 × 開場 × 人味的排列組合框架
- 句首去 AI 味的專屬技巧
- 40 個 benchmark test case
- 台灣在地化詞彙替換建議

## 授權

MIT © [Jimmy Yen](https://github.com/cawa0505)

本專案基於 [Raymond Hou (雷蒙三十)](https://github.com/Raymondhou0917) 的 [opencode-speak-human-tw](https://github.com/Raymondhou0917/speak-human-tw) 修改，原專案同樣採用 MIT 授權。
