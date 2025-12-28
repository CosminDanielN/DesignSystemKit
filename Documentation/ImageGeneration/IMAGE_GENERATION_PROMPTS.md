# Image Generation Prompts

AI-powered visual asset generation prompts for consistent design system aesthetics.

---

## Color Palette Reference

When generating images, reference these exact colors:

**Light Theme:**
- Primary Accent: `#4F7FF2` (Soft Blue)
- Success: `#2D9F5E` (Calm Green)
- Warning: `#E89F3C` (Soft Amber)  
- Error: `#D85D5D` (Muted Red)
- Text: `#1A1A1A` to `#8A8A8A` (Grays)
- Backgrounds: `#FFFFFF` to `#F1F3F5` (Off-whites)

**Dark Theme:**
- Primary Accent: `#5B8CF5` (Bright Blue)
- Success: `#3FB870` (Calm Green)
- Text: `#FFFFFF` to `#7A7A7A` (Light grays)
- Backgrounds: `#0D0D0D` to `#252525` (Dark grays)

---

## Icon Generation

### Style Prompt Template
```
Create a minimal, line-based icon for [CONCEPT]. 
Style: 2pt stroke weight, rounded line caps, 24x24pt artboard.
Aesthetic: Clean, modern, professional, minimal detail.
Color: Monochrome, single color (#4F7FF2 soft blue).
Background: Transparent.
Similar to: SF Symbols, Lucide Icons, Heroicons.
```

### Examples

**Search Icon:**
```
Create a minimal line-based magnifying glass icon.
2pt stroke, rounded caps, 24x24px artboard.
Soft blue color (#4F7FF2), transparent background.
Simple circular lens with angled handle.
```

**Settings Icon:**
```
Create a minimal line-based gear/cog icon.
2pt stroke, rounded caps, 24x24px.
Soft blue (#4F7FF2), 6-8 gear teeth.
Circular center, evenly spaced teeth.
```

**Notification Icon:**
```
Create a minimal line-based bell icon.
2pt stroke, rounded caps, 24x24px.
Soft blue (#4F7FF2), simple bell shape.
Small clapper inside, subtle ring arc on top.
```

---

## Illustration Generation

### Style Prompt Template
```
Create a minimal, abstract illustration for [CONCEPT].
Style: Flat geometric shapes, soft gradients, generous whitespace.
Colors: Primarily soft blue (#4F7FF2) with accents of calm green (#2D9F5E).
Aesthetic: Modern, professional, calming, not playful.
Composition: Balanced, asymmetric, generous negative space.
Detail level: Minimal - only essential shapes.
Similar to: Linear app illustrations, Arc browser visuals, modern SaaS product art.
```

### Examples

**Empty State - No Data:**
```
Minimal illustration for "no data" empty state.
Geometric composition: overlapping rounded rectangles suggesting charts/graphs.
Colors: Soft blue (#4F7FF2) gradient with 20% accents opacity, light gray background (#F8F9FA).
Style: Flat, modern, calm. Generous whitespace.
Dimensions: 400x300px, landscape orientation.
```

**Success Confirmation:**
```
Minimal illustration for success confirmation.
Geometric: Large circle with checkmark, subtle glow/gradient.
Colors: Calm green (#2D9F5E) gradient, white background.
Style: Clean, modern, reassuring not celebratory.
Dimensions: 300x300px, square.
```

**Error State:**
```
Minimal illustration for error state.
Geometric: Abstract alert symbol or broken connection visual.
Colors: Muted red (#D85D5D) with neutral grays, not alarming.
Style: Professional, calm, helpful not scary.
Dimensions: 400x300px.
```

---

## Background & Texture Generation

### Subtle Gradient Background
```
Create a subtle gradient background for app interface.
Colors: Transition from off-white (#F8F9FA) to light gray (#F1F3F5).
Direction: Top-left to bottom-right diagonal.
Style: Barely visible, extremely subtle (10% opacity difference).
No noise, no patterns, clean gradient only.
Dimensions: 1440x900px.
```

### Abstract Shape Background
```
Create abstract geometric shape background.
Elements: 3-4 large rounded rectangles/circles, blurred edges.
Colors: Soft blue (#4F7FF2) at 5% opacity, layered.
Composition: Asymmetric, some shapes cut off at edges.
Style: Modern, minimal, calming, suitable for hero section.
Dimensions: 1920x1080px.
```

---

## Typography in Images

When including text in generated images:

**Font Guidance:**
```
Font: San Francisco (iOS), Inter, or Roboto (if SF unavailable).
Weights: Regular (400), Medium (500), Semibold (600), Bold (700).
Never use: Decorative, script, or serif fonts.
```

**Size Hierarchy:**
- Hero Text: 48-64pt, Bold
- Headlines: 28-34pt, Semi-bold
- Body: 15-17pt, Regular

---

## Asset Export Specifications

### Icon Exports
- **Format**: SVG (vector) or PNG @3x
- **Size**: 24x24pt @1x, 72x72px @3x
- **Color Space**: sRGB
- **Background**: Transparent
- **Naming**: Use kebab-case: `icon-name.svg`

### Illustration Exports
- **Format**: PNG @2x or SVG
- **Size**: Varies (common: 400x300, 600x400, 800x600)
- **Color Space**: sRGB
- **Compression**: Optimized PNG (< 100KB ideal)
- **Naming**: Use kebab-case: `empty-state-illustration.png`

### Background Exports
- **Format**: PNG or WebP
- **Size**: Based on usage (375x667 for mobile, 1440x900 for desktop)
- **Quality**: High (90%+ for gradients)
- **Naming**: Descriptive: `gradient-background-light.png`

---

## Prompt Optimization Tips

### Effective Prompting
1. **Be specific about style**: "minimal line-based" not just "icon"
2. **Reference exact colors**: Hex codes ensure consistency
3. **Specify dimensions**: Prevents arbitrary sizing
4. **Provide visual references**: "Similar to SF Symbols" sets expectations  
5. **State what to avoid**: "Not playful, not decorative"

### Consistency Keywords
Use these terms consistently across prompts:
- "Minimal" - Reduced visual complexity
- "Clean" - No unnecessary elements
- "Modern" - Contemporary, not dated
- "Professional" - Sophisticated, polished
- "Calm" - Soothing, not aggressive
- "Soft" - Gentle colors and shapes

### Iteration Process
1. Generate initial asset with base prompt
2. Evaluate against brand guidelines  
3. Refine prompt with specific adjustments
4. Re-generate until consistent
5. Document final prompt for reuse

---

## AI Tool Recommendations

### For Icons
- **DALL-E 3**: High-quality, follows prompts well
- **Midjourney**: Good for stylistic consistency (use `--style raw` flag)
- **Figma AI**: Direct integration with design tools

### For Illustrations
- **Midjourney v6**: Great for abstract geometric art (`--style raw --ar 4:3`)
- **DALL-E 3**: Reliable, good color accuracy
- **Adobe Firefly**: Commercial-safe option

### For Backgrounds
- **Midjourney**: Excellent gradient and abstract shapes
- **DALL-E 3**: Precise color control
- **Stable Diffusion**: Customizable with ControlNet

---

## Prompt Templates by Use Case

### App Store Screenshots
```
Create iOS app screenshot mockup showcasing [FEATURE].
Style: Clean, modern, minimal UI.
Colors: Light theme - soft blue accent (#4F7FF2), white background.
Layout: [Describe layout]. Generous whitespace, 4pt grid spacing.
Typography: San Francisco font, clear hierarchy.
Device: iPhone 15 Pro mockup (bezel-less).
Dimensions: 1290x2796px (App Store Storybay aspect).
No device frame - interface only.
```

### Marketing Assets
```
Create marketing hero image for [PRODUCT/FEATURE].
Composition: Abstract geometric shapes, product interface mockup overlay.
Colors: Soft blue (#4F7FF2) gradient, white/off-white background.
Style: Modern, minimal, professional, calming.
Text: [HEADLINE] in SF Pro Display Bold.
Dimensions: 1920x1080px (16:9).
Layout: Asymmetric balance, left or right focus.
```

### Social Media
```
Create social media post image for [ANNOUNCEMENT].
Platform: [Instagram/Twitter/LinkedIn] optimized dimensions.
Style: Minimal, modern, on-brand colors.
Colors: Soft blue (#4F7FF2), white background, calm accents.
Text: [MESSAGE] in clear hierarchy.
Branding: Subtle, not overwhelming.
Dimensions: 1080x1080px (Instagram), 1200x675px (Twitter).
```

---

## Consistency Checklist

Before finalizing any generated image:

- [ ] Colors match design system palette (exact hex codes)
- [ ] Style aligns with "minimal & beautiful" philosophy
- [ ] No aggressive or alarming visual elements
- [ ] Appropriate for both light and dark UI contexts
- [ ] Text uses approved fonts (SF, Inter, Roboto)
- [ ] Generous whitespace maintained
- [ ] Professional, calm, modern aesthetic
- [ ] Accessible color contrasts (4.5:1 minimum)
- [ ] File size optimized (< 100KB for illustrations ideal)
- [ ] Proper export format and naming convention

---

**Remember: Generated assets should feel cohesive with the rest of the design system. When in doubt, err on the side of simplicity and subtlety.**
