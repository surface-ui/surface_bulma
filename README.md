# SurfaceBulma

A set of simple [Surface](https://github.com/msaraiva/surface/) components
based on [Bulma](https://bulma.io/).

**Documentation** and **live examples** can be found at http://surface-demo.msaraiva.io/uicomponents.

> **Note**: This is not a full-featured suite of components yet. Most of
  the functionality we have so far is based on the requirements we had
  to build Surface's [website](http://surface-demo.msaraiva.io).

## Components

  * [Button](http://surface-demo.msaraiva.io/uicomponents/Button) -
    The classic button, in different colors, sizes, and states.
    (Thanks [Tiago Morais](https://github.com/tiagoefmoraes)).
  * [Table](http://surface-demo.msaraiva.io/uicomponents/Table) -
    The inevitable HTML table.
  * [Tabs](http://surface-demo.msaraiva.io/uicomponents/Tabs) -
    A simple horizontal navigation tabs component.
  * Form inputs
    Most of the Form inputs that exist in Surface are now available.
  * Panel component
  * Navbar
  * Dialog (Soon!)
  * Card (Thanks [Justin M Morgan](https://github.com/justin-m-morgan))
  * Dropdown (Thanks [Justin M Morgan](https://github.com/justin-m-morgan))
  * Message (Thanks [Justin M Morgan](https://github.com/justin-m-morgan))

More components will be added soon. Contributions are welcome!

## Example

```jsx
<Table data={{ album <- @albums }} rowClass={{ &rowClass/2 }} bordered>
  <Column label="Album">
    {{ album.name }}
  </Column>
  <Column label="Released">
    {{ album.released }}
  </Column>
  <Column label="Artist">
    <a href="#">{{ album.artist }}</a>
  </Column>
</Table>
```

## Usage

Add `surface_bulma` to the list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    ...
    {:surface_bulma, "~> 0.3.0"}
  ]
end
```

To use bulma's CSS styles, choose one of the following methods:

### 1. Using CDN or downloading files

Add the following line to your `layout_view.ex`:

```
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.8.0/css/bulma.min.css" />
```

Or download the `.css` file and manually add it to your `priv/static/css` folder.
In this case, add the following line to your `layout_view.ex`:

```
<link rel="stylesheet" href={{ Routes.static_path(@conn, "/css/bulma.min.css") }} />
```

### 2. NPM or Yarn

Add `bulma` to the list of dependencies in `assets/package.json`:

```
"dependencies": {
  ...
  "bulma": "0.8.0"
}
```

## License

Copyright (c) 2020, Marlus Saraiva.

Surface source code is licensed under the [MIT License](LICENSE.md).
