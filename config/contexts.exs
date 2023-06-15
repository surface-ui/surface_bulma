import Config

config :surface,
  components: [
    {Surface.Components.Form.Field, [default_class: "field"]},
    {Surface.Components.Form.Label, [default_class: "label"]},
    {SurfaceBulma.Dropdown, propagate_context_to_slots: true},
    {SurfaceBulma.Navbar, propagate_context_to_slots: true},
    {SurfaceBulma.Navbar.Brand, propagate_context_to_slots: true},
    {SurfaceBulma.Navbar.Dropdown, propagate_context_to_slots: true},
    {SurfaceBulma.Form, propagate_context_to_slots: true},
    {SurfaceBulma.Form.Checkbox, propagate_context_to_slots: true},
    {SurfaceBulma.Form.Input, propagate_context_to_slots: true},
    {SurfaceBulma.Form.TextInput, propagate_context_to_slots: true},
    {SurfaceBulma.Form.PasswordInput, propagate_context_to_slots: true},
    {SurfaceBulma.Form.InputWrapper, propagate_context_to_slots: true},
    {SurfaceBulma.Form.InputWrapperTest.Slot, propagate_context_to_slots: true},
    {SurfaceBulma.Form.InputWrapper, :render_left_addon, propagate_context_to_slots: true},
    {SurfaceBulma.Form.InputWrapper, :render_right_addon, propagate_context_to_slots: true},
    {SurfaceBulma.Form.FileInput, propagate_context_to_slots: true},
    {SurfaceBulma.Form.Select, propagate_context_to_slots: true},
    {SurfaceBulma.Panel, propagate_context_to_slots: true},
    {SurfaceBulma.Panel.Tab, propagate_context_to_slots: true},
    {SurfaceBulma.Panel.Tab.TabItem, propagate_context_to_slots: true}
  ]
