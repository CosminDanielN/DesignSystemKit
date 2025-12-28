# Brand Guidelines

## OverviewDesignSystemKit represents a minimal, beautiful design language inspired by modern aesthetics (superlocaldesign.com, Linear, Arc). These guidelines ensure consistent visual identity across all applications.

---

## Design Philosophy

### Minimal & Beautiful
Every element is purposeful and refined. Clean layouts with generous whitespace create breathing room. No unnecessary decoration or embellishment.

### Calm & Neutral  
Soft, non-alarming color palettes promote a peaceful experience. Gentle contrasts avoid visual stress. Subtle depth through shadows and layers.

### Clear & Readable
Typography with excellent hierarchy ensures content is scannable. High contrast between text and backgrounds. Dynamic Type support for accessibility.

### Timeless & Elegant
Classic design patterns that age gracefully. Avoids trendy flourishes that quickly date. Professional and sophisticated.

---

## Color Palette

###Light Theme

**Text Colors**
- **Primary**: `#1A1A1A` - Near black for maximum readability
- **Secondary**: `#4A4A4A` - Dark gray for supporting text
- **Tertiary**: `#8A8A8A` - Medium gray for hints and captions
- **Disabled**: `#BDBDBD` - Light gray for inactive elements

**Backgrounds**
- **Primary**: `#FFFFFF` - Clean white
- **Secondary**: `#F8F9FA` - Off-white for subtle contrast
- **Tertiary**: `#F1F3F5` - Light gray for cards
- **Elevated**: `#FFFFFF` (with shadow)

**Accent & Brand**
- **Primary Accent**: `#4F7FF2` - Soft blue, calm and professional
- **Secondary Accent**: `#6B93F5` - Light blue variant
- **Tertiary Accent**: `#A8C5F7` - Pale blue for subtle highlights

**Status Colors**
- **Success**: `#2D9F5E` - Calm green (not aggressive)
- **Warning**: `#E89F3C` - Soft amber (not alarming)
- **Error**: `#D85D5D` - Muted red (not harsh)
- **Info**: `#4F7FF2` - Soft blue

### Dark Theme

**Text Colors**
- **Primary**: `#FFFFFF` - White for maximum readability
- **Secondary**: `#B4B4B4` - Light gray for supporting text
- **Tertiary**: `#7A7A7A` - Medium gray for hints
- **Disabled**: `#4A4A4A` - Dark gray for inactive elements

**Backgrounds**
- **Primary**: `#0D0D0D` - Near black
- **Secondary**: `#1A1A1A` - Dark gray
- **Tertiary**: `#252525` - Medium dark for cards
- **Elevated**: `#2A2A2A` (with subtle shadow)

**Accent & Brand**
- **Primary Accent**: `#5B8CF5` - Bright but calm blue
- **Secondary Accent**: `#7AA2F7` - Light blue variant
- **Tertiary Accent**: `#4F7FF2` - Medium blue

**Status Colors**
- **Success**: `#3FB870` - Calm green
- **Warning**: `#F5B55F` - Soft amber
- **Error**: `#E87777` - Muted red
- **Info**: `#5B8CF5` - Soft blue

### Color Usage Guidelines

**Do's:**
- Use primary accent for CTAs and interactive elements
- Maintain minimum 4.5:1 contrast ratio for text (WCAG AA)
- Use status colors sparingly to maintain their meaning
- Apply backgrounds in layers for depth (primary → secondary → tertiary)

**Don'ts:**
- Never use pure black `#000000` or pure white `#FFFFFF` for text
- Don't use bright, saturated colors that feel aggressive
- Avoid using accent colors for large background areas
- Don't ignore theme-specific color values

---

## Typography

### Font Family
**Native iOS System Font** (San Francisco)
- Optimized for Apple platforms
- Excellent legibility at all sizes  
- Supports Dynamic Type accessibility
- Professional and timeless

### Type Scale

**Titles** (Bold weight)
- Extra Large: 34pt - Major page headings
- Large: 28pt - Section headings
- Medium: 22pt - Card/panel headings
- Small: 20pt - Sub-section headings

**Headlines** (Semi-bold weight)
- Large: 18pt - List headers
- Medium: 17pt - Default headline size
- Small: 16pt - Compact headlines

**Body** (Regular/Medium weight)
- Large: 17pt - Comfortable reading
- Medium: 15pt - Default body size ✨
- Small: 14pt - Dense text areas
- Emphasized variants use Medium weight

**Captions & Labels** (Regular/Medium weight)
- Large: 13pt - Field labels
- Medium: 12pt - Tags, metadata
- Small: 11pt - Footnotes

### Line Height
- **Tight**: 1.2x - Headlines and titles
- **Normal**: 1.4x - Body text (default) ✨
- **Relaxed**: 1.6x - Long-form reading
- **Loose**: 1.8x - Extra spacious layouts

### Letter Spacing
- **Tight**: -0.5pt - Large titles
- **Normal**: 0pt - Most text (default) ✨
- **Wide**: 0.5pt - Small caps, labels
- **Extra Wide**: 1pt - Special emphasis

### Typography Guidelines

**Do's:**
- Support Dynamic Type for accessibility
- Use semantic hierarchy (title → headline → body → caption)
- Apply generous line heights (minimum 1.4x)
- Maintain clear distinction between title, headline, and body

**Don'ts:**
- Never use all-caps for long text (only short labels)
- Avoid line heights below 1.2x
- Don't mix more than 3 weights in a single view
- Never use decorative or script fonts

---

## Spacing & Layout

### Grid System
**4pt Base Grid** - All spacing values are multiples of 4

**Core Scale:**
- `4pt` (xxsmall) - Tight internal spacing
- `8pt` (xsmall) - Small gaps, icon-to-text
- `12pt` (small) - Related items
- `16pt` (medium) - Default spacing ✨
- `20pt` (large) - Comfortable spacing
- `24pt` (xlarge) - Section breaks
- `32pt` (xxlarge) - Major sections
- `40pt`, `48pt`, `64pt` - Larger separations

### Semantic Spacing

**Component Internal:**
- Small Button: 8pt padding
- Medium Button: 16pt padding
- Large Button: 24pt padding

**Layout Sections: **
- Screen edges: 16-24pt margins
- Between sections: 24-32pt gaps
- Related groups: 12-16pt gaps
- Unrelated groups: 24pt+ gaps

### Layout Guidelines

**Do's:**
- Use screen edge margins (16-24pt) consistently
- Apply generous padding inside components (12-24pt)
- Create clear visual groupings with spacing
- Maintain vertical rhythm using the 4pt grid

**Don'ts:**
- Never use arbitrary spacing values (stick to the scale)
- Avoid cramped layouts (minimum 12pt between unrelated items)
- Don't let content touch screen edges
- Never nest padding excessively (compounds visual weight)

---

## Elevation & Shadows

### Shadow System
Subtle elevation creates depth without being heavy-handed.

**Levels:**
- **Level 0** (None) - Flat elements (dividers, inline text)
- **Level 1** (XSmall) - Barely visible (subtle cards)
- **Level 2** (Small) - Standard cards and panels ✨
- **Level 3** (Medium) - Elevated content (modals, popovers)
- **Level 4** (Large) - Floating elements (FABs, tooltips)
- **Level 5** (XLarge) - Maximum elevation (sheets, alerts)

**Shadow Values:**
- Soft, semi-transparent black (`opacity: 0.04-0.12`)
- Vertical offset greater than blur radius
- Layered shadows for realism (2 shadows per element)

### Elevation Guidelines

**Do's:**
- Use shadows consistently for similar components
- Apply layered shadows for depth (small sharp + large soft)
- Adapt shadow opacity to theme (lighter in dark mode)
- Maintain a clear hierarchy (nav bar > cards > flat content)

**Don'ts:**
- Never use harsh, dark shadows (keep opacity low)
- Avoid inconsistent elevation for similar elements
- Don't over-use maximum elevation (dilutes its impact)
- Never apply shadows to text (use color/weight instead)

---

## Corner Radius

### Radius Scale
- `0pt` (None) - Sharp edges (dividers, alerts)
- `4pt` (XSmall) - Tight rounding (chips, small tags)
- `8pt` (Small) - Subtle rounding
- `12pt` (Medium) - Standard rounding ✨
- `16pt` (Large) - Comfortable rounding (cards)
- `20pt` (XLarge) - Generous rounding
- `24pt` (XXLarge) - Very rounded
- `9999pt` (Full) - Pills, circular buttons

### Radius Guidelines

**Do's:**
- Use 12pt as the default for most components
- Apply consistent radius within a component
- Use full radius for pills and circular elements
- Maintain visual consistency across related components

**Don'ts:**
- Avoid mixing too many radius values (stick to 2-3)
- Never use tiny radius on large elements (looks unfinished)
- Don't over-round (creates a toy-like aesthetic)

---

## Voice & Tone

This design system embodies **calm neutrality**. The visual language should feel:

### Characteristics
- **Calm**: Never aggressive or urgent
- **Neutral**: No judgment or pressure
- **Clear**: Obvious and unambiguous
- **Professional**: Polished and refined
- **Accessible**: Inclusive and thoughtful

### Forbidden Words (in UI copy)
- "Too much"
- "Should"
- "Improve"
- "Fix"
- "Reduce"
- "Limit"
- "Addiction"
- "Problem"

### Preferred Language
- "Compared to"
- "Different from"
- "Changed"
- "Pattern"
- "Typical"
- "Heavier/lighter"
- "More/less than usual"

---

##Iconography

### Style
- **Line-based icons** - Simple, minimal
- **2pt stroke weight** - Consistent thickness
- **Rounded caps** - Softer feel
- **24x24pt artboard** - Standard size
- **Optical centering** - Visually balanced

### Usage
- Icons always paired with labels (except universally recognized)
- Consistent sizing within a context (20-24pt most common)
- Monochrome (use theme colors, not multicolor)
- Align with text baseline

---

## Motion & Animation

### Principles
- **Subtle**: Animations should feel effortless
- **Fast**: 200-300ms for most transitions
- **Natural**: Ease curves, not linear
- **Purposeful**: Only animate when it adds clarity

### Duration Scale
- **Instant**: 0ms - State changes
- **Fast**: 100-200ms - Micro-interactions
- **Normal**: 300ms - Standard transitions ✨
- **Slow**: 500ms - Complex animations
- **XSlow**: 800ms - Dramatic reveals (rare)

### Easing
- **Ease In Out**: Default for most animations
- **Ease Out**: Entering elements
- **Ease In**: Exiting elements
- **Spring**: Natural, bouncy (use sparingly)

---

## Accessibility

### Minimum Requirements
- **Color Contrast**: WCAG AA (4.5:1 for  normal text, 3:1 for large text)
- **Dynamic Type**: Support all accessibility sizes
- **VoiceOver**: Proper labels on all interactive elements
- **Touch Targets**: Minimum 44x44pt
- **Reduce Motion**: Respect system preference

### Testing Checklist
- ✅ Test all text sizes with largest Dynamic Type
- ✅ Verify color contrast with Accessibility Inspector
- ✅ Navigate entire flow with VoiceOver
- ✅ Ensure all buttons meet minimum touch size
- ✅ Test in Reduce Motion mode

---

## Cross-Platform Consistency

The design system is built for **iOS first**, but principles apply elsewhere:

### iOS (Native)
- Use native iOS components wrapped in DS styling
- Respect iOS HIG where it doesn't conflict
- SF Symbols for icons when possible

### Future Platforms
- Web: Translate to CSS variables
- Android: Adapt to Material Design where necessary
- Desktop: Scale appropriately for larger screens

---

## Do's and Don'ts Summary

### Visual Design

**Do:**
✅ Use soft, muted colors
✅ Apply generous whitespace  
✅ Create clear visual hierarchy
✅ Maintain consistent spacing (4pt grid)
✅ Use subtle shadows for depth

**Don't:**
❌ Use aggressive, saturated colors
❌ Cram content together
❌ Create ambiguous hierarchy
❌ Use arbitrary spacing values
❌ Apply harsh shadows

### Typography

**Do:**
✅ Support Dynamic Type
✅ Use clear hierarchy  
✅ Apply generous line heights (1.4x+)
✅ Maintain high contrast

**Don'ts:**
❌ Use decorative fonts
❌ Mix too many weights
❌ Skimp on line height
❌ Use low-contrast text

### Interaction

**Do:**
✅ Provide clear feedback  
✅ Use purposeful animation  
✅ Label all interactive elements
✅ Maintain 44pt touch targets

**Don't:**
❌ Create ambiguous states
❌ Over-animate
❌ Hide functionality
❌ Use tiny tap areas

---

**Remember: This design system is a tool for clarity, calm, and quality. Every decision should reinforce these values.**
