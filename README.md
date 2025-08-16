# Pinterest Embed Web

A Flutter plugin for embedding Pinterest boards into Flutter web applications.

## 📦 Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  pinterest_embed_web:
    git:
      url: https://github.com/blubnana-org/pinterest_embed_web.git
```

## 🚀 Usage

To embed a Pinterest board, use the `PinterestEmbedPlugin` widget:

```dart
import 'package:pinterest_embed_plugin/pinterest_embed_plugin.dart';

PinterestEmbedPlugin(
    boardUrl:'your-board-id',
    boardWidth: _boardWidthMobile,
    scaleHeight: _scaleHeightMobile,
    scaleWidth: _scaleWidthMobile,
)
```

Replace `'your-board-id'` with the actual ID of the Pinterest board you wish to embed.

## 🧩 Features

- Embed Pinterest boards seamlessly into Flutter web applications.
- Customizable width and height for responsive design.
- Lightweight and easy to integrate.

## ✅ Supported Platforms

- Web

## 🧪 Example

For a complete example, refer to the [example directory](https://github.com/blubnana-org/pinterest_embed_web/tree/main/pinterest_embed_plugin/example).

## 📄 License

This package is licensed under the MIT License. See the [LICENSE](https://github.com/blubnana-org/pinterest_embed_web/blob/main/pinterest_embed_plugin/LICENSE) file for more details.

## 🤝 Contributing

Contributions are welcome! Please fork the repository, create a new branch, and submit a pull request with your proposed changes.

## 📢 Acknowledgements

This package utilizes the `HtmlElementView` widget, which allows embedding HTML elements into Flutter web applications.
