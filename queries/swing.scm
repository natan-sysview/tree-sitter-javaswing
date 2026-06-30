; Swing-oriented query layer for the experimental javaswing grammar.

((import_declaration
  (scoped_identifier
    scope: (scoped_identifier
      scope: (identifier) @swing.import.root
      name: (identifier) @swing.import.package)
    name: (identifier) @swing.import.type))
  (#eq? @swing.import.root "javax")
  (#eq? @swing.import.package "swing"))

((import_declaration
  (scoped_identifier
    scope: (identifier) @swing.import.root
    name: (identifier) @swing.import.package)
  (asterisk) @swing.import.wildcard)
  (#eq? @swing.import.root "javax")
  (#eq? @swing.import.package "swing"))

((class_declaration
  name: (identifier) @swing.class.name
  superclass: (superclass
    (type_identifier) @swing.class.superclass))
  (#match? @swing.class.superclass "^(JPanel|JFrame|JDialog|JWindow|JApplet)$"))

((method_declaration
  name: (identifier) @swing.init.method)
  (#eq? @swing.init.method "initComponents"))

((field_declaration
  type: (type_identifier) @swing.field.type
  declarator: (variable_declarator
    name: (identifier) @swing.field.name))
  (#match? @swing.field.type "^(J[A-Z][A-Za-z0-9_]*|AbstractButton|ButtonGroup|TableModel|ListModel|ComboBoxModel)$"))

((assignment_expression
  left: (identifier) @swing.component.name
  right: (object_creation_expression
    type: (type_identifier) @swing.component.type))
  (#match? @swing.component.type "^(J[A-Z][A-Za-z0-9_]*|GroupLayout|GridBagLayout|BorderLayout|FlowLayout)$"))

((method_invocation
  name: (identifier) @swing.listener.method)
  (#match? @swing.listener.method "^add.*Listener$"))

((method_invocation
  name: (identifier) @swing.layout.method)
  (#match? @swing.layout.method "^(setLayout|setBounds|setPreferredSize|add)$"))
