---
title: "GGPLOT2"
layout: lesson
root: .
minutes: 25
---

```{r setup}
library(ggplot2)
```

## The Grammar of Graphics

- GGPLOT2 is an r library that allows us to easily make publication quality plots
- Based on the "Grammar of Graphics"

## Building Layers

    Data + Aesthetics + Geoms

## Data

- Should be "tidy"
- May need to think carefully about how it is formatted
- Tall vs. Wide data

```{r data}
head(mtcars)
```

##

```{r data2}
ggplot(data = mtcars)
```

## Aesthetics
 
- This is how the data is "mapped" to a visual element
- We are most familiar with `x` and `y` mappings

```{r aesthetics, eval=FALSE}
ggplot(data = mtcars,
       mapping = aes(x = disp,
                     y = hp))
```

##

```{r aesthetics2, echo=FALSE}
ggplot(data = mtcars,
       mapping = aes(x = disp,
                     y = hp))
```

## Geometries

- This allows us to display our data

```{r geoms, eval=FALSE}
ggplot(data = mtcars,
       mapping = aes(x = disp,
                     y = hp)) +
  geom_point()
```

##

```{r geoms2, echo=FALSE}
ggplot(data = mtcars,
       mapping = aes(x = disp,
                     y = hp)) +
  geom_point()
```

## Review of layers

1. data
2. aesthetics
3. geoms

## Let's Play

```{r play1, eval=FALSE}
ggplot(data = mtcars,
       mapping = aes(x = disp,
                     y = hp,
                     col = cyl)) +
  geom_point()
```

##

```{r play2, echo=FALSE}
ggplot(data = mtcars,
       mapping = aes(x = disp,
                     y = hp,
                     col = cyl)) +
  geom_point()
```

## Exercise

- There are many different anaesthetics (x, y, col, size, shape etc.)
- There are many different geoms
- Check out the cheat sheet and see if you can construct your own


[Previous topic](05-lesson-05-dataviz.html) --- [Next topic](07-lesson-07-just-enough-statistics.html)