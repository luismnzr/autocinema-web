# Panel de Administración - Autocinema Ink

## Resumen

Se ha implementado un **Panel de Administración** usando **Decap CMS** para gestionar el contenido de la web de Autocinema Ink de forma visual, sin necesidad de editar código.

## ¿Qué se implementó?

### 1. **Estructura de Datos YAML**
- Los directores y sus videos ahora se almacenan en archivos YAML en `/data/directors/`
- Cada director tiene su propio archivo (ej: `alejandro-lubezki.yml`)
- Datos incluyen: nombre, slug, videos, categorías, IDs de Vimeo, etc.

### 2. **Panel de Administración (Decap CMS)**
- **URL**: `/admin` (ej: `https://tu-sitio.com/admin`)
- Interfaz visual tipo WordPress para editar contenido
- No requiere conocimientos técnicos

### 3. **Templates Dinámicos**
- `director-template.html.erb`: Template genérico para todas las páginas de directores
- `index.html.erb`: Lista de directores generada dinámicamente desde los datos YAML
- Se eliminaron 12 archivos HTML hardcodeados y se reemplazaron con 1 template dinámico

## Cómo Usar el Panel de Administración

### Acceso Local (Desarrollo)

1. **Habilitar backend local** en `/source/admin/config.yml`:
   ```yaml
   local_backend: true
   ```

2. **Instalar Decap CMS Proxy**:
   ```bash
   npx decap-server
   ```

3. **Acceder al panel**:
   - Abrir `http://localhost:4567/admin` (después de correr `middleman server`)
   - Iniciar sesión (en modo local no requiere autenticación)

### Acceso en Producción

1. **Configurar Git Gateway**:
   - El archivo `config.yml` ya está configurado para usar `git-gateway`
   - Necesitas configurar **Netlify Identity** o **GitHub OAuth** para autenticación

2. **Acceder al panel**:
   - Visitar `https://autocinemaink.com/admin`
   - Iniciar sesión con credenciales de GitHub/Netlify

## Estructura de Archivos

```
/home/user/autocinema-web/
├── data/
│   └── directors/           # Datos de directores en YAML
│       ├── alejandro-lubezki.yml
│       ├── alex-de-la-iglesia.yml
│       ├── arzate.yml
│       ├── callan-green.yml
│       ├── david-romay.yml
│       ├── eduardo-casanova.yml
│       ├── hermanos-prada.yml
│       ├── hugo-menduina.yml
│       ├── lorena-de-la-teja.yml
│       ├── pipe-ybarra.yml
│       ├── pollo.yml
│       └── prat.yml
├── source/
│   ├── admin/              # Panel de administración
│   │   ├── index.html      # UI de Decap CMS
│   │   └── config.yml      # Configuración del CMS
│   ├── director-template.html.erb  # Template para páginas de directores
│   └── index.html.erb      # Página principal (ahora dinámica)
└── config.rb               # Configuración de Middleman (con proxy pages)
```

## Funcionalidades del Panel Admin

### Gestionar Directores

**Agregar nuevo director:**
1. Ir a "Collections" → "Directores"
2. Click en "New Director"
3. Llenar los campos:
   - Nombre
   - Slug (URL del director, ej: `john-doe`)
   - Nombre a Mostrar
   - Clase CSS (ej: `director-john`)
   - GIF de Hover (subir o seleccionar)
   - Orden (posición en la lista)
   - Habilitado (activar/desactivar)
4. Agregar videos
5. Click en "Publish"

**Editar director existente:**
1. Ir a "Collections" → "Directores"
2. Seleccionar el director
3. Editar los campos necesarios
4. Click en "Publish"

**Agregar/editar videos:**
- Cada director puede tener múltiples videos
- Campos por video:
  - Título
  - Vimeo ID (solo el ID, ej: `376976120`)
  - Categoría/Subtítulo
  - URL Móvil (URL completa del video)
  - Clase CSS (ej: `lubezki-1`)

**Cambiar orden de directores:**
- Editar el campo "Orden" (números del 1 en adelante)
- Los directores se muestran ordenados ascendentemente

**Ocultar/mostrar director:**
- Cambiar el campo "Habilitado" a `false` para ocultarlo
- Cambiar a `true` para mostrarlo de nuevo

## Workflow Editorial

Decap CMS usa **Editorial Workflow** por defecto:

1. **Draft**: Cambios guardados como borrador
2. **In Review**: Cambios listos para revisión
3. **Ready**: Cambios aprobados, listos para publicar
4. **Publish**: Cambios van a Git (commit automático)

## Ventajas del Nuevo Sistema

### Para el Cliente:
✅ Interfaz visual fácil de usar
✅ No necesita editar código
✅ No necesita conocimientos técnicos
✅ Puede agregar/editar directores y videos sin ayuda
✅ Preview de cambios antes de publicar

### Para el Desarrollador:
✅ Eliminó 12 archivos hardcodeados
✅ Código más mantenible (1 template vs 12 archivos)
✅ Datos separados de la presentación
✅ Más fácil de escalar (agregar directores)
✅ Control de versiones con Git

## Despliegue

### Build del Sitio

```bash
bundle exec middleman build
```

Esto genera:
- Páginas de directores dinámicamente desde YAML
- Panel admin en `/admin`
- HTML estático listo para deploy

### Hosting Recomendado

**Netlify (Recomendado)**:
- Deploy automático desde Git
- Git Gateway integrado para Decap CMS
- HTTPS gratis
- CDN global

**GitHub Pages**:
- Deploy estático
- Requiere configuración manual de autenticación

**Vercel/CloudFlare Pages**:
- Similar a Netlify
- Requiere configuración de OAuth

## Próximos Pasos

1. **Configurar autenticación** (Git Gateway con Netlify o GitHub OAuth)
2. **Desplegar a producción**
3. **Capacitar al cliente** en el uso del panel admin
4. **Opcional**: Agregar colección para "Configuración del sitio" (contacto, redes sociales, etc.)

## Notas Importantes

- **No editar archivos YAML manualmente** mientras uses el panel admin
- **Hacer backup** antes de cambios importantes
- **Los cambios se guardan en Git** automáticamente
- **Las imágenes/GIFs** deben estar en `/source/images/`

## Soporte

Para preguntas o problemas:
- Documentación Decap CMS: https://decapcms.org/docs/
- Middleman Data Files: https://middlemanapp.com/advanced/data-files/
